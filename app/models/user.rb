# frozen_string_literal: true

class User < ApplicationRecord
  has_many :resumes, dependent: :destroy
  has_many :employment_experiences, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
end
