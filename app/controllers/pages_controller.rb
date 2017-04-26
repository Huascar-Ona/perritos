class PagesController < ApplicationController
  def index
    @tag = Tag.new()
    @tag = Tag.all
  end 
end