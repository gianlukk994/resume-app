# frozen_string_literal: true

# == Schema Information
#
# Table name: employment_experiences
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  start_date  :datetime
#  end_date    :datetime
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class EmploymentExperience < ApplicationRecord
  belongs_to :user

  has_many :resume_employment_experiences
end
