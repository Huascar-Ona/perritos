class PhotosController < ApplicationController
  before_action :set_photo, only: [:edit, :update, :destroy]

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
    @photo = Photo.new(set_image_hash)
    respond_to do |format|
      if @photo.save
      #   # format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
      #   # format.json { render :show, status: :created, location: @photo }
      #   format.html { render json: [@photo.to_jq_upload].to_json, :content_type => 'text/html', :layout => false }
      #format.json { render json: {files: [@photo.to_jq_upload]}, status: :created, location: @photo }
      else
      #   # format.html { render :new }
      #   # format.json { render json: @photo.errors, status: :unprocessable_entity }
        format.json {render result: 'error', content_type: 'text/html'}
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
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def set_image_hash
      image_attr = photo_params
      {image: image_attr[:image][0], dog_id: image_attr[:dog_id]}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:dog_id, :image => [])
    end
end