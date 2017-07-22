class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    @image.save
    flash[:notice] = "Image Added!"

    redirect_to admin_images_path
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
    flash[:success] = "Image updated!"
    redirect_to admin_images_path
    else
      flash[:danger] = "Error, #{@image.errors.keys}, #{@image.errors.values}"
      render :end
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to admin_images_path
  end

private

  def image_params
  params.require(:image).permit(:url)
  end

end
