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
      render items_show_all_records_path(:id=>params[:l_id])
    
    else

        render action: 'add'
      
   
        
	end

  end
  
  def show_single_record
      @item = Item.find(params[:id])
  end
  
  def destroy
       @item = Item.find(params[:id]).destroy
       
       #redirect_to root_path
       respond_to do |format|
         show_all_records
         format.js { render "show_all_records"} 
         
       end
      
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
      @list = List.new
      @lists = List.all
  end
  
  def show_all_records
       @items = Item.order(sort_column+ " " + sort_direction)
       
       
  end
  
  def sort
    # id here is the list_id
      @items = Item.find(params[:id])
      
  end
  
  private 
  def secure_params
      params.require(:item).permit(:title,:due_date,:work_time,:completed,:list_id)
  end
  
  def sort_column
    Item.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
