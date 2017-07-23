class ItemsController < ApplicationController

    helper_method :sort_column, :sort_direction
    respond_to :html, :js
     
    
  def add
      @item  = Item.new
     
     
  end
 
  def create
      
      @item = Item.new(secure_params)
    #  respond_to do |format|
	if @item.save
      flash[:notice] = "Task #{@item.title} is submitted"
      if flash[:isUpdate]
         @var = Item.find(flash[:toDestroy]).destroy
      end
	#format.html {
      redirect_to root_path
    
    else

        render action: 'add'
      
   
        
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
	  @var  = Item.new
      @item = Item.find(params[:id])
      flash[:isUpdate] = true
      flash[:toDestroy] = @item.id
      
  end
  
  def home
      @items = Item.order(sort_column+ " " + sort_direction)
      
	
  end
  
  def sort
      @items = Item.all
      
  end
  
  private 
  def secure_params
      params.require(:item).permit(:title,:due_date,:work_time,:completed)
  end
  
  def sort_column
    Item.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
