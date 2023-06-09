class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params.dig(:session, :email)&.downcase
    if user.try(:authenticate, params.dig(:session, :password))
      if user.activated
        log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        redirect_back_or user
      else
        flash[:warning] = "Account not activated. Check your email for the activation link."
        redirect_to root_url
      end
    else
    # Create an error message.
    flash.now[:danger] = t "invalid_email_password_combination"
    render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
