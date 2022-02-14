require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

before do
  if Count.count == 0
    Count.create(number: 0)
  end
  if Count2.count == 0
    Count2.create(number: 0)
  end
end

enable :sessions

get '/' do
  @count = Count.first.number
  @count2 = Count2.first.number
  erb :index
end

post '/plus' do
  count = Count.first
  count.number = count.number + 1
  count.save
  redirect "/"
end

post '/minus' do
  count = Count.first
  count.number = count.number - 1
  count.save
  redirect "/"
end

post '/clear' do
  count = Count.first
  count.number = 0
  count.save
  redirect "/"
end

post '/multi' do
  count = Count.first
  count.number = count.number * 2
  count.save
  redirect "/"
end

post '/div' do
  count = Count.first
  unless count != 0
    count.number = count.number / 2
    count.save
  end
  redirect "/"
end

post '/plus2' do
  count2 = Count2.first
  count2.number = count2.number + 1
  count2.save
  redirect "/"
end

post '/title' do
  session[:a] = params[:title]
  redirect "/"
end