# frozen_string_literal: true

class Resume < ApplicationRecord
  belongs_to :user
  has_many :employment_experiences, through: :user
end
