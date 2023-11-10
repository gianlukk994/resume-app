# frozen_string_literal: true

class User < ApplicationRecord
  has_many :resumes, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
end
