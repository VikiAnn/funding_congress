class PagesController < ApplicationController
  def home
  end

  def legislators
    redirect_to legislators_path
  end
end
