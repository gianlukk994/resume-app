# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :resumes, dependent: :destroy
  has_many :employment_experiences, dependent: :destroy
  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills

  validates :name, presence: true
  validates :email, presence: true
end
