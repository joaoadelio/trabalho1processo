class DevolutionsController < ApplicationController
  before_action :set_devolution, only: [:show, :edit, :update, :destroy]

  # GET /devolutions
  # GET /devolutions.json
  def index
    @devolutions = Devolution.all
  end

  # GET /devolutions/1
  # GET /devolutions/1.json
  def show
  end

  # GET /devolutions/new
  def new
    @devolution = Devolution.new
  end

  # GET /devolutions/1/edit
  def edit
  end

  # POST /devolutions
  # POST /devolutions.json
  def create
    @devolution = Devolution.new(devolution_params)

    respond_to do |format|
      if @devolution.save
        format.html { redirect_to @devolution, notice: 'Devolution was successfully created.' }
        format.json { render :show, status: :created, location: @devolution }
      else
        format.html { render :new }
        format.json { render json: @devolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devolutions/1
  # PATCH/PUT /devolutions/1.json
  def update
    respond_to do |format|
      if @devolution.update(devolution_params)
        format.html { redirect_to @devolution, notice: 'Devolution was successfully updated.' }
        format.json { render :show, status: :ok, location: @devolution }
      else
        format.html { render :edit }
        format.json { render json: @devolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devolutions/1
  # DELETE /devolutions/1.json
  def destroy
    @devolution.destroy
    respond_to do |format|
      format.html { redirect_to devolutions_url, notice: 'Devolution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_devolution
      @devolution = Devolution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def devolution_params
      params.require(:devolution).permit(:devolutionDate)
    end
end
