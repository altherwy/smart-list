
class ItemsController < ApplicationController
    
   
    helper_method :sort_column, :sort_direction
    respond_to :html, :js
     
  
  def add
      @item  = Item.new
     
     
  end
 
  def create
      
      @item = Item.new(secure_params)
	if @item.save
        s = "submitted"
        
      
      
      if flash[:isUpdate]
          s = "updated"
         @var = Item.find(flash[:toDestroy]).destroy
         
         
      end
       #flash[:notice] = "Task #{@item.title} is #{s}"
      
            respond_to do |format|
                show_all_records(@item.list_id, true)
               format.js {render "show_all_records"}
                
                
            end
    
    else

        render action: 'add'
      
        
        
	end
    

  end
  
  def show_single_record
      @item = Item.find(params[:id])
  end
  
  def destroy
       @item = Item.find(params[:id]).destroy
     #  flash[:warning] = "Task #{@item.title} is deleted"
     
       respond_to do |format|
         show_all_records(@item.list_id,true)
         format.js { render "show_all_records"} 
         
       end
      
  end


  def delete_all
    Item.all.destroy_all
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
  
  def show_all_records(listID=0, flag = false)
    if(flag)
        @items = Item.where(list_id: listID).order(sort_column+ " " + sort_direction)
      else
       @items = Item.where(list_id: params[:id]).order(sort_column+ " " + sort_direction)
     end
       
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
