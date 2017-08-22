class ListsController < ApplicationController
  def new
    @list = List.new
  end
  
  def create
    @list = List.new(secure_params)
    if @list.save
     # flash[:notice] = "List #{@list.name} is created"
      redirect_to root_path
    end
  end
  
  private
  def secure_params
      params.require(:list).permit(:name)
  end
end
