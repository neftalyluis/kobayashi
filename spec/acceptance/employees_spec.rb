# frozen_string_literal: true

require "rails_helper"
require "rspec_api_documentation/dsl"

resource "General information for Employees" do
  get "/employees/" do
    example "Returns all the employees on the company" do
      do_request
      expect(status) == 200
    end
  end

  get "/employees/:id" do
    example "Shows the detail of an employee" do
      do_request
      expect(status) == 200
    end
  end

  post "/employees/" do
    example "Creates a new employee" do
      do_request
      expect(status) == 200
    end
  end

  put "/employees/:id" do
    example "Updates the employee data" do
      do_request
      expect(status) == 200
    end
  end

  delete "/employees/:id" do
    example "Removes the employee data" do
      do_request
      expect(status) == 200
    end
  end
end
