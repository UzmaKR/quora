class SessionsController < ApplicationController

  def new
  end

  def create
    user=User.find_by_email(params[:session][:email])
    if user and user.authenticate(params[:session][:password])
      login(user)
      redirect_to user_path(user)
    else
      redirect_to new_session_path
    end
  end

  def delete
    session.clear
    redirect_to '/'
  end
end
