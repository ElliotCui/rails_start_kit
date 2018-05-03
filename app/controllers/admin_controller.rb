class AdminController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :build_flash
  before_action :check_current_user

  include AdminHelper

  def build_flash
    flash.notice  ||= params[:flash] && params[:flash][:notice]
    flash.alert   ||= params[:flash] && params[:flash][:alert]

    flash[:success] ||= params[:flash] && params[:flash][:success]
    flash[:error] ||= params[:flash] && params[:flash][:error]
  end

  def current_user
    @current_user ||= Account.find(session[:super_account_id]) if session[:super_account_id]
    return redirect_to login_url unless @current_user
    @current_user
  end

  private

  def check_current_user
    redirect_to login_url unless current_user
  end
end

