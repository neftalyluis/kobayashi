# frozen_string_literal: true

require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Employees" do
  explanation "General information for Employees"
  header "Content-Type", "application/json"

  let(:employee) { create(:employee) }

  get "/admin/employees" do
    let!(:employees) { create_list(:employee, 25) }

    example "Returns all the employees on the company" do
      do_request
      expect(status).to eq(200)
    end
  end

  get "/admin/employees/:id" do
    parameter :id, "The ID of the employee", required: true
    let(:id) { employee.id }

    example "Shows the detail of an employee" do
      do_request
      expect(status).to eq(200)
    end
  end

  post "/admin/employees" do
    parameter :first_name, "The first name of the employee", scope: :employee, required: true
    parameter :last_name, "The last name of the employee", scope: :employee, required: true
    parameter :position, "The position the employee occupies, e.g: Software Engineer", scope: :employee, required: true
    parameter :date_of_birth, "The birth date, e.g: 2000/11/12", scope: :employee, required: true
    parameter :employment_date, "The employee's starting day on the company e.g: 2010/12/24", scope: :employee, required: true

    let(:first_name) { Faker::Name.first_name }
    let(:last_name) { Faker::Name.last_name }
    let(:position) { Faker::Company.profession }
    let(:date_of_birth) { Faker::Date.birthday }
    let(:employment_date) { Faker::Date.backward(days: 365) }

    let(:raw_post) { params.to_json }

    example "Creates a new employee" do
      do_request
      expect(status).to eq(201)
    end
  end

  put "/admin/employees/:id" do
    parameter :id, "The ID of the employee", required: true
    let(:id) { employee.id }

    with_options scope: :employee, with_example: true do
      parameter :first_name, "The first name of the employee", required: true
      parameter :last_name, "The last name of the employee", required: true
      parameter :position, "The position the employee occupies, e.g: Software Engineer", required: true
      parameter :date_of_birth, "The birth date, e.g: 2000/11/12", required: true
      parameter :employment_date, "The employee's starting day on the company e.g: 2010/12/24", required: true
    end

    let(:first_name) { Faker::Name.first_name }
    let(:last_name) { Faker::Name.last_name }
    let(:position) { Faker::Company.profession }
    let(:date_of_birth) { Faker::Date.birthday }
    let(:employment_date) { Faker::Date.backward(days: 365) }

    let(:raw_post) { params.to_json }

    example "Updates the employee data" do
      do_request
      expect(status).to eq(200)
    end
  end

  delete "/admin/employees/:id" do
    parameter :id, "The ID of the employee", required: true
    let(:id) { employee.id }

    example "Removes an employee data" do
      do_request
      expect(status).to eq(204)
    end
  end
end
