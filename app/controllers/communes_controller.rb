class CommunesController < ApplicationController
  before_action :set_commune, only: [ :show, :update ]

  def index
    @communes = Commune.all
    respond_to do |format|
      format.json
      format.html { head :not_acceptable }
    end
  end

  def create
    head :forbidden
  end

  def show
    unless @commune
      head :not_found
    end
  end

  def update
    if @commune && params[:commune]
      @commune.update(commune_params)
    elsif @commune
      head :bad_request
    else
      head :not_found
    end
  end

  private

  def set_commune
    @commune = Commune.find_by(code_insee: params[:id])
  end

  def commune_params
    params.require(:commune).permit(:name, :code_insee)
  end
end
