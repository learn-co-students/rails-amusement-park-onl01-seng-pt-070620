class SessionController < ApplicationController
    skip_before_action :verify_user, only: [:new, :create]

    def destroy
        session.destroy
        redirect_to root_path
    end
    
    def new
        @user = User.new
        @users = User.all
    end

    def create
        if @user = User.find_by(name: params[:user][:name])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

end
