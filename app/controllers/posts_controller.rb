class PostsController < ApplicationController
  def index
    # getting posts by most recent
    # then using 'page' method of Kaminari to get a 'page'
    # In this case, a page consists of 10 posts as configured in kaminari_config.rb
    # We're passing params[:page] to the page method so that we can control which page
    # we get. And if params[:page] is nil, we'll get the first page, so it
    # works by default.
    @posts = Post.order(created_at: :desc).page(params[:page])
  end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(params)
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(params.require(:post))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end
end
