class IdeaImagesController < ApplicationController
  def index
  end

  def new
    @idea = current_user.ideas.find(params[:idea_id])
    @idea_image = @idea.idea_images.new
  end

  def create
    @user = current_user
    @idea = @user.ideas.find(params[:idea_id])
    @idea = Idea.find(params[:idea_id])
    IdeaImage.create(idea_image_params)
    # @idea.images << Image.create(idea_image_params)


    #via terminal --> User.last.ideas.last.images.create() <-- works

    # @image = Image.new(image_params)
    # @idea = @user.ideas.find_by(idea: params[:idea])
    # @user = current_user


    # @user = current_user
    # @idea = @user.ideas.find(params[:idea_id])
    # @image = Image.new(image_params)

    @user = current_user
    @idea = @user.ideas.find(params[:idea_id]) #if I add .id it says nil
    @image = @idea.images.new(idea_image_params)
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

  def idea_image_params
    params.require(:idea_image).permit(:id, :idea_id)
  end
end
