class ItemsController < ApplicationController

    
    
  def add
      @item  = Item.new 
     
  end
  
  def create
      @item = Item.new(secure_params)
	if @item.save
      flash[:notice] = "Form submitted by #{@item.title}"
      redirect_to items_update_path
	else
	redirect_to root_path
	end

  end

  def update
      @item = Item.find(params[:id])
  end

  def delete
  end
  
  def home
	@items = Item.all
  end
  
  private 
  def secure_params
      params.require(:item).permit(:title,:creation_date,:expiration_date,:work_time,:completed)
  end
end
