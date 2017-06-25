require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  # THe purpose of this lesson was to work through the Create, Read, Update and Delete. The model used was Post. First create, a posts/new route was created that rendered erb :new. The new contained a form to create a new post. This form included a method of post and action of '/posts/index'. The inputs types where text and the name used created the key value pair that was passed into the param. A class for Post was created. It simply inherited from active record which made the next step much easier. Back to the new.erb, the input type submit with a value of submit was also added before the form closed. The post method was sent to the post '/posts/index' route. Here the params that were passed in are used to create an Post.create(params) instance. ActiveRecord::Base handles the attribute assignment, initialization, and saving. This new instance is stored into an instance variable. The erb :index is rendered. A path to get
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :deleted
  end

end
