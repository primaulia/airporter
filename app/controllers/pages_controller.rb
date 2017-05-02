class PagesController < ApplicationController
  def index
    render 'homepage'
  end

  def about_page
    redirect_to action: :error_page
    redirect_to flights_path
  end

  def error_page
    render '404'
  end
end
