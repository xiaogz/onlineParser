require 'rubygems'
require 'bundler'

Bundler.require

require './parserService'
run Sinatra::Application
