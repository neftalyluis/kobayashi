# frozen_string_literal: true

class Attendance < ApplicationRecord
  belongs_to :employee
  validates :work_date, :check_in, :check_out, presence: true
end
