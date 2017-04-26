class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  # GET /dogs
  # GET /dogs.json
  def index
    @dogs = Dog.all
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
    @selectedTag = params[:tagId]

  end

  # GET /dogs/1/edit
  def edit
  end

  # POST /dogs
  # POST /dogs.json
  def create
    
    @dog = Dog.new(dog_params)
    @dog.contact_id = User.select('id').where(uid: dog_params[:contact_id]).first.id
    byebug
    @dog.photos.build(photo_name: dog_params[:image].original_filename, image_file_name: dog_params[:image].path, image_content_type: dog_params[:image].content_type, image_file_size: dog_params[:image].size )
       
    respond_to do |format|
      if @dog.save
        set_photoid
        Dog.where(id: @dog.id).update_all(avatar_id: @photoID)
        @dogTag = DogTag.new(dog_id: @dog.id, tag_id: dog_params[:tag_id])
        if @dogTag.save
          format.html { redirect_to @dog, notice: 'Dog was successfully created.' }
          format.json { render :show, status: :created, location: @dog }
        else  
          format.html { render :new }
          format.json { render json: @dogTag.errors, status: :unprocessable_entity }
        end 
      else
        format.html { render :new }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1
  # PATCH/PUT /dogs/1.json
  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to @dog, notice: 'Dog was successfully updated.' }
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    @dog.destroy
    respond_to do |format|
      format.html { redirect_to dogs_url, notice: 'Dog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    def set_photoid
      @dog.photos.each do |p|
        @photoID = p.id
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      params.require(:dog).permit(:name, :contact_id, :image, :avatar_id, :tag_id, :display_name)
      #params.fetch(:dog, {})
    end
end
