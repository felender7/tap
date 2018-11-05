class CreateCvsController < ApplicationController
  before_action :set_create_cv, only: [:show, :edit, :update, :destroy]
  before_action :education_type
  # GET /create_cvs
  # GET /create_cvs.json
  def index
    @create_cvs = CreateCv.all
  end

  # GET /create_cvs/1
  # GET /create_cvs/1.json
  def show
  end

  # GET /create_cvs/new
  def new
    @create_cv = CreateCv.new
  end

  # GET /create_cvs/1/edit
  def edit
  end

  # POST /create_cvs
  # POST /create_cvs.json
  def create
    @create_cv = CreateCv.new(create_cv_params)

    respond_to do |format|
      if @create_cv.save
        format.html { redirect_to @create_cv, notice: 'Create cv was successfully created.' }
        format.json { render :show, status: :created, location: @create_cv }
      else
        format.html { render :new }
        format.json { render json: @create_cv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /create_cvs/1
  # PATCH/PUT /create_cvs/1.json
  def update
    respond_to do |format|
      if @create_cv.update(create_cv_params)
        format.html { redirect_to @create_cv, notice: 'Create cv was successfully updated.' }
        format.json { render :show, status: :ok, location: @create_cv }
      else
        format.html { render :edit }
        format.json { render json: @create_cv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /create_cvs/1
  # DELETE /create_cvs/1.json
  def destroy
    @create_cv.destroy
    respond_to do |format|
      format.html { redirect_to create_cvs_url, notice: 'Create cv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_create_cv
      @create_cv = CreateCv.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_cv_params
      params.require(:create_cv).permit(:id_passport,:identification_type, :gender, :date_of_birth, :place_of_birth, :disability, :education_type,:slug)
    end

    def education_type
      @qualifications = CreateCv.all
    end
end
