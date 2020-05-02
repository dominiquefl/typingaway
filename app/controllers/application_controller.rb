class ApplicationController < ActionController::Base
  def moon
    cookies[:moon] = {
      value: 'dark mode on'
    }
    redirect_to welcome_index_path
  end

  def sun
    cookies.delete(:moon)
    redirect_to welcome_index_path
  end
end
