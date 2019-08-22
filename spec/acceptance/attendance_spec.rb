# frozen_string_literal: true

require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Attendance" do
  get "/orders" do
    example "Listing orders" do
      do_request

      status.should == 200
    end
  end
end
