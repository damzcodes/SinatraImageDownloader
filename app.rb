require 'sinatra'
require 'json'

storage = '/home/damilola/Downloads/img' # Should be changed to desired strage location
file_name = File.join(storage, 'images.txt')

get '/' do
	erb :index
end

post '/' do
	 File.open(file_name, "w+") do |f|
	 	(params["url"] || {}).values.each do |url|
	 		f.puts(url)
	 	end
	 end

	`screen ruby downloader.rb`
	 redirect '/'
end

get '/status.json' do

	url_count = File.open(file_name) { |f| f.count }
	img_count = 0

	Dir.chdir(storage) do
		img_count = Dir['**/*.jp*g'].length
	end

	 {:downloads => img_count, :total => url_count}.to_json
end
