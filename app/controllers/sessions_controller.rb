class SessionsController < ApplicationController

    def create
        user = User.find_by(username: session_params[:username])
        if !!user && user.authenticate(session_params[:password])
            render json: user.to_json(:except => :password_digest)
        else
            render json: {status: "error", code: 400, message: "Can't find purchases without start and end date"}
        end
        end 
    end 

    def destroy 
        session.delete
    end 




    private 

    def session_params
        params.require(:session).permit(:username, :password)
    end 

end 