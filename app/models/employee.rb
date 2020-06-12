# frozen_string_literal: true

class Employee < ApplicationRecord
  has_many :attendances
  validates :first_name, :last_name, :position, :date_of_birth, :employment_date, presence: true
end
