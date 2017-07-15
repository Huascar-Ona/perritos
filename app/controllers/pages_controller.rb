class PagesController < ApplicationController
  def index
    @tags = Tag.all
    #Use this when in prod
    #@dogs = Dog.limit(12).order("RANDOM()")
    #to test with less than 12 records use this
    # @dogs = Dog.all
    @dogs = Dog.page params[:page]

    # byebug
    # # hash2 = OpenStruct.new(contact.as_json)
    # @dogJson = @dogs.as_json

    # render json:{dogs:@dogJson}
  end 
end