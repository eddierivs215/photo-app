class UserImagesController < ApplicationController
   before_action :set_user_image, only: [:show, :edit, :update, :destroy]

  # GET /user_images
  # GET /user_images.json
  def index
    @user_images = UserImages.all
  end

  # GET /user_images/1
  def show
    @user = User.find(params[:id])
    @user_images = @user.images
  end

  # GET /user_images/new
  def new
    @user_image = UserImage.new
  end

  # GET /user_images/1/edit
  def edit
  end

  # POST /user_images
  # POST /user_images.json
  def create
    if params[:image_id].present?
       @user_image = Userimage.new(image_id: params[:image_id], user: current_user) 
    else
      flash[:error] = 'image did not load'
    end
  end

  #DELETE /user_images/1
  # DELETE /user_images/1.json
  def destroy
    @user_image.destroy
    respond_to do |format|
      format.html { redirect_to my_portfolio_path, 
                     notice: 'image was successfully removed from portfolio.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_image
      @user_image = current_user.user_images.where(image_id: params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_image_params
      params.require(:user_image).permit(:user_id, :image_id, :integer)
    end
end
