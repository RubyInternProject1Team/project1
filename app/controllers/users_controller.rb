class UsersController < ApplicationController
    before_action :logged_in_user, only: %i(edit update destroy)
    before_action :find_user, except: %i(index new create)
    def show
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new user_params
        if @user.save
            @user.send_activation_email
            flash[:info] = "Please check your email to activate your account."
            redirect_to signup_url
        else
            render :new
        end
    end

    private
    
    def user_params
        params.require(:user)
              .permit(:name, :email, :password, :password_confirmation)
    end

    def find_user
        @user = User.find_by id: params[:id]
        redirect_to root_path unless @user
    end

    def logged_in_user
        unless logged_in?
            flash[:danger] = "You must be logged in."
            store_location
            redirect_to root_url
        end
    end
end
