class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
    @categories = Category.all
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:notice] = "Idea saved!"
      redirect_to ideas_path
    else
      flash[:notice] = "Idea not saved. #{@idea.errors.keys}, #{@idea.errors.values}"
      render :new
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      flash[:notice] = "#Idea updated!"
      redirect_to ideas_path
    else
      flash[:notice] = "Idea not updated. #{@idea.errors}"
      render :edit
    end

  end

  def destroy
    @idea = Idea.find(params[:id])
    if @idea.destroy
      flash[:notice] = "Idea deleted"
      redirect_to ideas_path
    else
      flash[:notice] = "Idea not deleted, #{@idea.errors.keys}, #{@idea.errors.values}"
      redirect_to idea_path(@idea)
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:idea, :category_id)
  end

end
