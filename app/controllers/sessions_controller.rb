class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    group = Group.find_by_name("admin")
    account = group.accounts.find_by_email(params[:email])
    login_success = account.authenticate_by(params[:password])

    if login_success
      session[:super_account_id] = account.id
      redirect_to admin_root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:super_account_id] = nil
    redirect_to admin_root_url, :notice => "Logged out!"
  end
end
