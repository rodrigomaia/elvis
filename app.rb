require 'rubygems'
require 'sinatra'
require("./app/scripts/elvis.rb")

before do
  Dir.glob("app/*/model.rb").each do |filez|
    require("./#{filez}") if File.file?(filez)
  end
end

get '/' do
  "This shit is hot!"
end

get '/:model/:action' do
  invoke_route(params[:model], params[:action], params)
end

get '/:model/:action/:other_params' do
  invoke_route(params[:model], params[:action], params[:other_params])
end

post '/:model/:action' do
  invoke_route(params[:model], params[:action], params)
end


=begin
curl -H 'Content-Type: application/json' -H 'Accept: application/json' -X POST localhost:4567/pessoa/gravar -d "{\"user\" : { \"email\" : \"elvis@gmail.com\", \"password\" : \"testes\"}}"
=end