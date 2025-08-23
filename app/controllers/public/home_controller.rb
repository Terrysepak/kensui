class Public::HomeController < ApplicationController
  def top
    redirect_to parks_path if user_signed_in?
  end
end
