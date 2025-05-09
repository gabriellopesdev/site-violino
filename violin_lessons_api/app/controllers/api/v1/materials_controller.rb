class Api::V1::MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :update, :destroy]

  # GET /api/v1/materials
  def index
    @materials = Material.all
    render json: @materials
  end

  # GET /api/v1/materials/:id
  def show
    render json: @material
  end

  # POST /api/v1/materials
  def create
    @material = Material.new(material_params)
    if @material.save
      render json: @material, status: :created
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/materials/:id
  def update
    if @material.update(material_params)
      render json: @material
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/materials/:id
  def destroy
    @material.destroy
    head :no_content
  end

  private

  def set_material
    @material = Material.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Material not found' }, status: :not_found
  end

  def material_params
    params.require(:material).permit(:name, :description, :price)
  end
end
