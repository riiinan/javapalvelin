class WelcomeController < ApplicationController
  def index
  end
  def accept_and_redirect
    cookies[:email] = {:value => params[:q]}
  end
end
