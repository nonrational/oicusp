require "sinatra"
require "sinatra/activerecord"

set :database, { adapter: "sqlite3", database: "oicusp.sqlite3" }

class Request < ActiveRecord::Base
  validates :raw, presence: true
end

get '*' do
  Request.create!(method: :get, raw: params)
end

post '*' do
  Request.create!(method: :post, raw: params)
end
