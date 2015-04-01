#!/usr/bin/env ruby
require 'httpclient'

## Load file
storage = '/home/damilola/Downloads/img' # Should be changed to desired strage location
file_name = File.join(storage, "images.txt")
unless File.exist? file_name
	puts "File not found"
	exit
end

## convert to ruby arr & pull out urls
urls = []
File.foreach(file_name) do |url|
	urls << url.chomp()
end

## loop trhough arr & pass to get_content
client = HTTPClient.new
urls.each_with_index do |url, index|
	image_data = client.get_content(url)
	img_file_name = File.join(storage, "image_#{index}.jpeg")
	File.open(img_file_name, 'wb') do |output|
		output.write(image_data)
	end

end

complete = File.join(storage, "completed.txt")
File.open(complete, 'w+'){|f| f << "Your download is complete"}

