class PostsController < ApplicationController

    include Rails.application.routes.url_helpers
    
    def index 
        session[:user_id] =
        if(params[:id] == session[:user_id])
           redner json:  Post.all
        else
            render json: "error", :error => :unproccessable_entity
        end 
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
