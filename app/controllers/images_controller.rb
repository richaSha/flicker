class ImagesController < ApplicationController

  def index
    if session[:user_id]
      @user = User.find(session[:user_id])
      @images = @user.images
    else
      redirect_to '/signup'
    end
  end

  def create
    @image = Image.create( image_params )
    if @image.save
      flash[:notice] = "Image is uploaded!!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem uploading image"
      redirect_to "/images/new"
    end
  end

  def new
    @image = Image.new
    @tag = Tag.new
    @user = User.all
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Image successfully deleted!"
    redirect_to "/"
  end

  def edit
    @image = Image.find(params[:id])
    @user = User.all
    @tag = Tag.new
  end

  def update
    @image= Image.find(params[:id])
    if @image.update(image_params)
      flash[:notice] = "Image successfully updated!"
    else
      flash[:notice] = "Something went wrong.. Please try again..."
    end
    redirect_to "/"
  end

  private

  def image_params
      params.require(:image).permit(:photo, :user_id, :name).merge({:user_id => session[:user_id]})
  end
end
