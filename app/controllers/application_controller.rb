class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    locale = I18n.available_locales.include?(locale) ? locale : nil
    I18n.locale = locale || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
