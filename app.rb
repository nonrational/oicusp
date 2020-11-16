require "sinatra"
require "sinatra/activerecord"
require "httparty"

set :database, { adapter: "sqlite3", database: "oicusp.sqlite3" }

class Request < ActiveRecord::Base; end

get '/log' do
  @requests = Request.all
  erb :log
end

get '*' do
  path = params['splat'][0]

  req_headers = headers.except("Host").merge({"Host" => "ocsp.apple.com"})

  response = HTTParty.get(
    "http://17.253.97.205#{path}",
    query: params.except('splat', 'captures'),
    headers: req_headers
  )

  Request.create!(method: :get, params: params, response: response)

  status response.code
  response.body
end

post '*' do
  Request.create!(method: :post, params: params)
  # HTTParty.get(path, query: params.except('splat', 'captures'))
end
