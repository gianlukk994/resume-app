# frozen_string_literal: true

# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  title      :string
#  summary    :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Resume < ApplicationRecord
  belongs_to :user

  has_many :resume_employment_experiences
  has_many :resume_skills

  has_many :employment_experiences, through: :resume_employment_experiences
  has_many :skills, through: :resume_skills
end
