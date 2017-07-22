class IdeasController < ApplicationController
  #users still have access to other users individal show idea pages
  # before_action :owns_ideas


  def index
    @ideas = current_user.ideas
  end

  def show
    @user = current_user
    @idea = @user.ideas.find(params[:id])
    @images = @idea.images
    @image = @idea.idea_images.new

    # @image = Image.new
    # @image.idea_id = @idea.id
    # @image.ideas.first.user = @user.id

  end

  def new
    # @user = User.find(params[:user_id])
    @user = current_user
    @idea = Idea.new
    #might not need below
    @categories = Category.all
  end

  def create
    # @user = User.find(params[:user_id])
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
    # @user = User.find(params[:user_id])
    @user = current_user
    @idea = @user.ideas.find(params[:id])
    # @idea = Idea.find(params[:id])
  end

  def update
    # @user = User.find(params[:user_id])
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
