class ImagesController < ApplicationController

  def index
  end

  def new
    @user = current_user
    @idea = @user.ideas.find(params[:idea_id])
    @image = @idea.images.new
  end

  def create
    #via terminal --> User.last.ideas.last.images.create() <-- works

    # @image = Image.new(image_params)
    # @idea = @user.ideas.find_by(idea: params[:idea])
    # @user = current_user


    # @user = current_user
    # @idea = @user.ideas.find(params[:idea_id])
    # @image = Image.new(image_params)

    @user = current_user
    @idea = @user.ideas.find(params[:idea_id]) #if I add .id it says nil
    @image = @idea.images.new(image_params)
# byebug
    if @image.save
      flash[:success] = "Image Added!"
      redirect_to user_idea_path(@user, @idea)
    else
      flash[:error] = "Error #{@image.errors.keys} #{@image.errors.values}"
      render :new
    end
  end

  def delete
    @user = current_user
    @idea = @user.ideas.find(params[:idea_id])
    @image = @idea.images.find(params[:image_id])
    if @image.destroy
      flash[:success] = "Image destroyed!"
      redirect_to user_idea_path(@user, @idea)
    else
    flash[:errror] = "Error, #{@image.errors.keys}, #{@image.errors.values}"
    end
  end

  private

  def image_params
    params.require(:image).permit(:url, :idea_id, :user_id)
  end
end
