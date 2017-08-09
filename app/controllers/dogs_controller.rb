class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :text
  # GET /dogs
  # GET /dogs.json
  def index
    @dogs = Dog.where(contact_id: current_user.id)
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
    respond_with(@dog)
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
    @selectedTag = params[:tagId]
    @contact_id = current_user.uid
    @dogSize = [['Pequeño','S'],['Mediano','M'],['Grande','L'], ['Extra Grande','X']]
    @dogSex = [['Femenino','F'],['Masculino','M']]
  end

  # GET /dogs/1/edit
  def edit
    @contact_id = @dog.contact_id
    @dog.tags.each do |tag| 
      @selectedTag = tag.id 
    end 
    respond_with(@dog)
  end

  # POST /dogs
  # POST /dogs.json
  def create
    @dog = Dog.new(dog_params)
    @dog.contact_id = User.select('id').where(uid: dog_params[:contact_id]).first.id
    
    respond_to do |format|
      if @dog.save
        @photo = Photo.new({image: dog_params[:image], dog_id: @dog.id})
        @dogTag = DogTag.new(dog_id: @dog.id, tag_id: dog_params[:tag_id])
        
        if @photo.save
          if @dogTag.save
            if Dog.where(id: @dog.id).update_all(avatar_id: @photo.id)
              format.html { redirect_to @dog, notice: 'Dog was successfully created.' }
              format.json { render :show, status: :created, location: @dog }
            else
              format.html { render :new }
              format.json { render json: @dog.errors, status: :unprocessable_entity }  
            end
          else  
            format.html { render :new }
            format.json { render json: @dogTag.errors, status: :unprocessable_entity }
          end 
        else
          format.html { render :new }
          format.json { render json: @photo.errors, status: :unprocessable_entity }
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
        format.html { redirect_to @dog, notice: 'Los datos de "' + @dog.name + '" se actualizaron correctamente.' }
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
      format.html { redirect_to dogs_url, notice: 'Los datos de "' + @dog.name + ' han sido borrados correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      params.require(:dog).permit(:name, :contact_id, :image, :tags, :tag_id, :latitude, :longitude, :description, :sex, :age, :race_id, :size, :vaccines)
    end
end
