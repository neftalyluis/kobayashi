# frozen_string_literal: true

class Admin::EmployeesController < ApplicationController
  before_action :find_employee, except: %i[index create]
  before_action :find_employees, only: %i[index]

  def index
    response_success(employees: @employees)
  end

  def show
    response_success(employee: @employee)
  end

  def check_in

  end

  def check_out

  end

  def create
    employee = Employee.new(employee_params)
    if employee.save
      response_created employee: employee
    else
      response_error message: employee.errors.full_messages
    end
  end

  def update
    @employee.update(employee_params)
    response_success employee: @employee
  end

  def destroy
    @employee.destroy
    response_success
  end

  private
    def employee_params
      params.require(:employee)
          .permit(
            :first_name,
              :last_name,
              :position,
              :date_of_birth,
              :employment_date
          )
    end

    def find_employee
      @employee = Employee.find(params[:id])
    end

    def find_employees
      @employees = Employee.all
    end
end
