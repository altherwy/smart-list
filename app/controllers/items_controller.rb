class ItemsController < ApplicationController

    
    
  def add
      @item  = Item.new 
     
  end
  
  def create
      @item = Item.new(secure_params)
	if @item.save
      flash[:notice] = "Form submitted by #{@item.title}"
	redirect_to root_path
	end

  end
  
  def show_single_record
      @item = Item.find(params[:id])
  end
  
  def destroy
       @item = Item.find(params[:id]).destroy
       flash[:notice] = "#{@item.title} has been deleted"
       redirect_to root_path
      
      
  end


  def delete_all
      @item = (Item.all).destroy_all
      flash[:notice] = "All Records Deletd"
      redirect_to root_path
  end
  
  def update
	@var = Item.new
      @item = Item.find(params[:id])
     # @item.update(title: , creation_date: , expiration_date:, work_time: , completed: )
  end
  
  def update_record
      
  end
  
  def home
	@items = Item.all
  end
  
  private 
  def secure_params
      params.require(:item).permit(:title,:creation_date,:expiration_date,:work_time,:completed)
  end
end
