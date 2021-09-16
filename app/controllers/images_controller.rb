# frozen_string_literal: true

# Controller to create, serve and destroy images
class ImagesController < ApplicationController
  before_action :set_image, only: %i[show destroy]

  def home
    redirect_to images_path
  end

  # GET /images or /images.json
  def index
    @images = Image.all
    @image = Image.new
  end

  # GET /images/1 or /images/1.json
  def show; end

  # POST /images or /images.json
  def create
    successful_save = true
    image_params[:files].each do |file|
      @image = Image.new({file: file})
      if !@image.save
        successful_save = false
        break
      end
    end

    respond_to do |format|
      if successful_save
        format.html { redirect_to root_path, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { redirect_to root_path, notice: 'Image failed to be stored.' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1 or /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Image was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    begin
      params.require(:image).permit(files: [])
    rescue ActionController::ParameterMissing
      respond_to do |format|
        format.html {render :index, :status => :unprocessable_entity}
      end
    end
  end
end
