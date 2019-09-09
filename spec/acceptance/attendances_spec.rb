# frozen_string_literal: true

require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Attendances" do
  get "/attendances/" do
    example "Gets the attendances for today" do
      do_request
      expect(status) == 200
    end
  end

  post "/attendances/" do
    example "Marks an attendance for today" do
      do_request
      expect(status) == 200
    end
  end
end
