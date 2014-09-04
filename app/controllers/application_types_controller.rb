require "userprofiles_controller"
class ApplicationTypesController < ApplicationController
  before_action :set_application_type, only: [:show, :edit, :update, :destroy]

  # GET /noapplications
  # GET /noapplications.json
  def index
    @application_types = ApplicationType.all
  end

  # GET /noapplications/1
  # GET /noapplications/1.json
  def show
  end

  # GET /noapplications/new
  def new
    @application_type = ApplicationType.new
  end

  # GET /noapplications/1/edit
  def edit
  end

  # POST /noapplications
  # POST /noapplications.json
  def create
    @application_type = ApplicationType.new(application_type_params)

    respond_to do |format|
      if @application_type.save
        format.html { redirect_to @application_type, notice: 'Application Type was successfully created.' }
        format.json { render :show, status: :created, location: @application_type }
      else
        format.html { render :new }
        format.json { render json: @application_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /noapplications/1
  # PATCH/PUT /noapplications/1.json
  def update
    respond_to do |format|
      if @application_type.update(application_type_params)
        format.html { redirect_to @application_type, notice: 'Application Type was successfully updated.' }
        format.json { render :show, status: :ok, location: @application_type }
      else
        format.html { render :edit }
        format.json { render json: @application_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noapplications/1
  # DELETE /noapplications/1.json
  def destroy
    @application_type.destroy
    respond_to do |format|
      format.html { redirect_to application_types_url, notice: 'Noapplication was successfully destroyed.' }
      format.json { head :no_content }
    
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application_type
      @application_type = ApplicationType.find(params[:id])
      # @userprofile = Userprofile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_type_params
      params.require(:application_type).permit(:no_of_application, :path)
    end
end


