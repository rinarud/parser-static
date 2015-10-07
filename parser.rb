require 'rubygems'
require 'json'

path = ARGV.join

unless File.file? path
	puts 'Invalid routine'
	exit
end

json = JSON.parse IO.read path
json.each do |style|
	h2 = {'feature'=> style['featureType'], 'element'=>style['elementType']}

	if style.key? 'stylers'
		style['stylers'].each do |h|
			h2.merge! h
		end
	end
	print '&style='

	h2.each do |key, value|
		if value != nil 
			print key +':'+value.to_s + '|'
		end
	end


end