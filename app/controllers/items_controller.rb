class ItemsController < ApplicationController

    attr_accessor :title
    
  def add
      @title  = Item.new
  end

  def update
  end

  def delete
  end
  
  def home
  end
end
