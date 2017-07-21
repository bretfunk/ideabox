class Admin::CategoriesController < Admin::BaseController

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.idea_id = params[:idea_id]

    @image.save
    flash[:notice] = "Comment Added!"
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def comment_params
  params.require(:image).permit(:url)
  end

end
