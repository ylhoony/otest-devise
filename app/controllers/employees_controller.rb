class EmployeesController < ApplicationController
  before_action :require_signed_in?, :has_current_company?

  # need to add authorization by user level
  # edit button in view should be conditional

  def index
    if current_company.users.include?(current_user)
      @employees = current_company.employees
    else
      redirect_to root_path
    end
  end

  def new
    # invite users
    
  end

  def create
    
  end

  def edit
    # only admin or user can edit selectively
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to employees_path
    else
      render :edit
    end
  end

  def destroy
    
  end

  private

    def employee_params
      params.require(:employee).permit(:user_id, :company_id, :job_title, :active)
    end

end
