class PhotosController < ApplicationController
  before_action :set_photo, only: [:edit, :update, :destroy]
  before_action :set_dog, only: [:new]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
    @dogId = params[:dogId]
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.json { render json: { success: true, fileID: @photo.id  }, status: 200}
      else
        format.json {render json: { error: @image.errors.full_messages.join(',')}, status: 400}
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    if @photo.destroy
      render json: { message: "File deleted from server" }
    end 
    # respond_to do |format|
    #   # format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
    #   # format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:dog_id, :image)
    end

    def set_dog
      @dog = Dog.find(params[:dogId])
    end 
end