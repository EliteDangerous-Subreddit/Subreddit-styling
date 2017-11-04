#output_style = :compressed

# Make a copy of sprites with a name that has no uniqueness of the hash.
on_sprite_saved do |filename|
	if File.exists?(filename)
		if Dir.pwd == '/sprites'
			FileUtils.mv(filename, '../')
		end
		ary = filename.split('/')
		ary.last.gsub! /-\S+\./, 'heet.'
		FileUtils.cp filename, ary.join('/')
		# Note: Compass outputs both with and without random hash images.
		# To not keep the one with hash, add: (Thanks to RaphaelDDL for this)
		FileUtils.rm_rf(filename)
	end
end


# Replace in stylesheets generated references to sprites
# by their counterparts without the hash uniqueness.
on_stylesheet_saved do |filename|
	if File.exists?(filename)
		css = File.read filename
		css = css.gsub(/(?<=url\()'\/images\/sprites-.+?'/, '%%spritesheet%%')
		#css = css.gsub(/(?<=url\()'\/images\/nmvotes-.+?'/, '%%nmvotesheet%%')
		File.open(filename, 'w+') do |f|
			f.puts css
		end
	end
end


#on_stylesheet_saved do |filename|
#	if File.exists?(filename)
#		css = File.read filename
#		File.open(filename, 'w+') do |f|
#			f << css.gsub(/(?<=url\()'\/images\/sprites-.+?'/, '%%spritesheet%%')
#		end
#	end
#end
