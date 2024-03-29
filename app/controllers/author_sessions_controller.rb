class AuthorSessionsController < ApplicationController
  def new
  end

  def create
    if login(params[:email], params[:password])
      Rails.logger.info("[#{self.class}] User logged in successfully")
      redirect_back_or_to(articles_path, notice: 'Logged in successfully!')
    else
      Rails.logger.info("[#{self.class}] User failed to login successfully")
      flash.now.alert = 'Login failed.'
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:authors, notice: 'Logged out!')
  end
end
