class PostsController < ApplicationController

    include Rails.application.routes.url_helpers
    
    def index 
        render json: Post.all
    end 


    def create
       post = Post.create(caption: post_params["caption"])
       post.avatar.attach(post_params["file"])
       post.photo_url = post.avatar.blob.url
       if post.save 
            render json: post
       else
            render json: post.errors
       end 
    end
    
    


    private 

    def post_params
        params.permit(:file, :caption)
    end 

end
