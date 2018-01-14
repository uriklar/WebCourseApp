class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    render json: @user.posts
  end

  def show
  	@user = User.find(params[:user_id])
  	render json: @user.posts.find(params[:id])
  end

  def create
  	# @post = Post.create(params[:post][:text], User.find(params[:user_id]))
  	# @user.posts.create(params[:text])
  	# @user = User.find(params[:user_id]).new.@post
  	# render json: @post
  	@user = User.find(params[:user_id])

  	@post = @user.posts.create(text: params[:post][:text])


		 if @post.save
	      render json: @post
	    else
	      render json: @post.errors
	    end  
  end

    def destroy
	  @user = User.find(params[:user_id])
	  @post = @user.posts.find(params[:id])

	  @post.destroy

	  render json: @post
    end 

    def search
    	byebug
    	puts "line1"
    	puts "line2"
      @user = User.find(params[:user_id])

  		result = @user.posts.select do |post|
       	 post.text.include?(params[:query])
       end

       render json: result
       # arr.each do |s|
        # if s.find(params[:query])
          # render json: s
        # end

       # end
        
      

      # @user.posts.find(params[:query])
      # post_search = array.select { |hash| hash[:text] = params[:query] }
    end
end
