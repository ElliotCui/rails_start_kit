class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_locale

  def set_current_locale
    I18n.locale = params[:locale].present? ? params[:locale] : "zh-CN"
  end
end
