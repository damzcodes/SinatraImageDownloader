# Sinatra Image Downloader

An extension to the current image downloader that allows users to download Facebook images from the LiveLink imageloader.

## To initiate:

1. Run `bundle install`
2. Run `sudo apt-get install screen`
3. Change "storage" variables to the path of your desired storage location in app.rb and downloader.rb
	E.g.```ruby
		storage = "your/desired/path"
		```
4. Run `rackup [-p:9292]`
5. Visit [the imageloader](http://imageloader.livelinkmedia.net/?redirect=http%3A%2F%2Flocalhost:9292)