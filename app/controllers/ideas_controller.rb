class IdeasController < ApplicationController
  #users still have access to other users individal show idea pages
  before_action :validate_user, only: [:index]


  def index
    @user = User.find(params[:user_id])
    @ideas = @user.ideas
  end

  def show
    # @idea = Idea.find(params[:id])
    @user = User.find(params[:user_id])
    @idea = Idea.new
  end

  def new
    @user = User.find(params[:user_id])
    @idea = Idea.new
    #might not need below
    @categories = Category.all
  end

  def create
    @user = User.find(params[:user_id])
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
    @user = User.find(params[:user_id])
    @idea = Idea.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
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
    @user = User.find(params[:user_id])
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
    params.require(:idea).permit(:idea, :category_id, :user_id)
  end

end
