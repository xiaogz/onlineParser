# this small online app simply returns a json object of any website 

require 'sinatra' # the framework that this service depends on
require 'nokogiri' # html smart parser tool
require 'thin' # replaces WEbrick server
require 'open-uri' # makes http GET requests into 'open'
require 'json' # for obvious reasons

get '/' do
  "Hi! To use our service, please send a http GET request from your app/software in the following format: '.../api/url/targetSite.com' and you will get the target site's page title and meta description"
end

get '/api/url/:urlInput' do
  content_type :json
  customLink = params[:urlInput]
  siteData = Nokogiri::HTML(open("https://" + customLink))
  pageTitle = siteData.title
  pageDescription = siteData.at_xpath("//meta[@name='description']/@content")
  {:title => pageTitle, :description => pageDescription}.to_json
end
