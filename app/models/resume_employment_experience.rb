# frozen_string_literal: true

# == Schema Information
#
# Table name: resume_employment_experiences
#
#  id                       :integer          not null, primary key
#  resume_id                :integer          not null
#  employment_experience_id :integer          not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
class ResumeEmploymentExperience < ApplicationRecord
  belongs_to :resume
  belongs_to :employment_experience
end
