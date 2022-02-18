class ListsController < ApplicationController
   def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: params[:id])
  end

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end

# resources :lists, only: [:index, :show, :new, :create] do
#   resources :bookmarks, only: [:new, :create]
