require 'bundler'
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)
require 'sinatra'

get '/hello' do
  '<h1>Hello world ! </h1>'
end