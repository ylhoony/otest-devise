class UnitOfMeasuresController < ApplicationController
  before_action :require_signed_in?, :has_current_company?

  def index
    @unit_of_measures = current_company.unit_of_measures
  end

  def new
    @unit_of_measure = UnitOfMeasure.new
  end

  def create
    @unit_of_measure = UnitOfMeasure.new(unit_of_measure_params)
    if @unit_of_measure.save
      redirect_to unit_of_measures_path
    else
      render :new
    end
  end

  def edit
    @unit_of_measure = UnitOfMeasure.find(params[:id])
  end

  def update
    @unit_of_measure = UnitOfMeasure.find(params[:id])
    if @unit_of_measure.update(unit_of_measure_params)
      redirect_to unit_of_measures_path
    else
      render :edit
    end
  end

  def destroy
    # need to add condition 
    # if user is the employee fo the current_company
    # if user has authorization for deleting this 
    unit_of_measure = UnitOfMeasure.find(params[:id])
    unit_of_measure.delete
    redirect_to unit_of_measures_path
  end

  def change_status
    unit_of_measure = UnitOfMeasure.find(params[:id])
    unit_of_measure.active? ? unit_of_measure.update(active: false) : unit_of_measure.update(active: true)
    redirect_to unit_of_measures_path, notice: "Status is updated successfully."
  end

  private

    def unit_of_measure_params
      params.require(:unit_of_measure).permit(:name, :company_id, :active)
    end

end
