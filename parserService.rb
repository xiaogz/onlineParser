# this small online app simply returns a json object of any website 

require 'sinatra' # the framework that this service depends on
require 'nokogiri' # html smart parser tool
require 'thin' # replaces WEbrick server
require 'open-uri' # makes http GET requests into 'open'
require 'json' # for obvious reasons
require 'open_uri_redirections' # allows browser redirects (my setting only allows from http to https)

set :bind, '0.0.0.0'
set :port, 8080

get '/' do
  "Hi! To use our service, please send a http GET request from your app/software in the following format: '.../api/url/targetSite.com' and you will get the target site's page title and meta description"
end

get '/api/url/:urlInput' do
  content_type :json
  customLink = params[:urlInput]
  siteData = Nokogiri::HTML(open("http://" + customLink, :allow_redirections => :safe))
  pageTitle = siteData.title
  pageDescription = siteData.at_xpath("//meta[@name='description']/@content")
  {:title => pageTitle, :description => pageDescription, :dateOfService => Time.now}.to_json
end
