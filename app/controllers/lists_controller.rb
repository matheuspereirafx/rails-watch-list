class ListsController < ApplicationController
  def index
    @lists = List.all
    @new_list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: "List created successfully!"
    else
      @lists = List.all
      @new_list = @list  # Mantém os erros
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, notice: "List deleted successfully!"
  end
  
  private

  def list_params
    params.require(:list).permit(:name)
  end
end
