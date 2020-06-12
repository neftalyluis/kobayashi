# frozen_string_literal: true

require "rails_helper"

RSpec.describe Employee, type: :model do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:position) }
  it { is_expected.to validate_presence_of(:date_of_birth) }
  it { is_expected.to validate_presence_of(:employment_date) }
  it { is_expected.to have_many(:attendances) }
end
