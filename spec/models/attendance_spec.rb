# frozen_string_literal: true

require "rails_helper"

RSpec.describe Attendance, type: :model do
  it { is_expected.to validate_presence_of(:work_date) }
  it { is_expected.to validate_presence_of(:check_in) }
  it { is_expected.to validate_presence_of(:check_out) }
  it { is_expected.to belong_to(:employee) }
end
