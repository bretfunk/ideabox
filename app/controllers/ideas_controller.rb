class IdeasController < ApplicationController

  def index
    @ideas = current_user.ideas
  end

  def show
    @user = current_user
    @idea = @user.ideas.find(params[:id])
    @images = @idea.images
    @image = @idea.idea_images.new

  end

  def new
    @user = current_user
    @idea = Idea.new
    @categories = Category.all
  end

  def create
    @user = current_user
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      flash[:notice] = "Idea saved!"
      redirect_to @user
    else
      flash[:notice] = "Idea not saved. #{@idea.errors.keys}, #{@idea.errors.values}"
      render :new
    end
  end

  def edit
    @user = current_user
    @idea = @user.ideas.find(params[:id])
  end

  def update
    @user = current_user
    @idea = @user.ideas.find(params[:id])
    if @idea.update(idea_params)
      flash[:notice] = "#Idea updated!"
      redirect_to @user
    else
      flash[:notice] = "Idea not updated. #{@idea.errors}"
      render :edit
    end

  end

  def destroy
    # @user = User.find(params[:user_id])
    @user = current_user
    @idea = @user.ideas.find(params[:id])
    if @idea.destroy
      flash[:notice] = "Idea deleted"
      redirect_to @user
    else
      flash[:notice] = "Idea not deleted, #{@idea.errors.keys}, #{@idea.errors.values}"
      redirect_to @user
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:idea, :category_id, :user_id, image_ids: [])
  end

end
