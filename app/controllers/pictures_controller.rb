class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def show
  end

  def edit
  end

  def create
      @picture = current_user.pictures.build(picture_params)
      if params[:back]
        render :new
      else
        if @picture.save
          redirect_to pictures_path, notice: "Post was successfully created."
        else
          render :new
        end
      end
    end

    def update
       if @picture.update(picture_params)
         redirect_to pictures_path, notice:"Edited post！"
       else
         render :edit
       end
     end

     def destroy
     @picture.destroy
     redirect_to pictures_path, notice:"Deleted post!"
   end

   def confirm
     @picture = Picture.new(picture_params)
    end

  private
  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:image, :content,:image_cache)
  end
end
