require 'sinatra/base'
require './models/blog'
require './models/post'

class BlogApp < Sinatra::Base
  use Rack::MethodOverride

  @@blog = Blog.new 'Tanya\'s Sinatra Blog', 'where things work'

  before do
    @blog_title = @@blog.title
    @blog_description = @@blog.description
  end

  get '/' do
    @blog = @@blog
    erb :welcome
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    redirect to '/new' if params[:title].empty? || params[:content].empty?
    redirect to '/new' if params[:content].size > 256

    post = Post.new params[:title], params[:content]
    @@blog.add post

    redirect to '/'
  end

  get '/search' do
    redirect to "/search/#{params[:tag]}"
  end

  get '/:id' do
    @post = @@blog.get params[:id].to_i
    halt 404 if @post.nil?

    erb :view
  end

  get '/search/:tag' do
    @tag = "##{params[:tag]}"
    @posts = @@blog.posts_containing @tag

    erb :search
  end

  delete '/:id' do
    @@blog.delete params[:id].to_i
    redirect to '/'
  end

  not_found do
    status 404
    erb :not_found
  end
end
