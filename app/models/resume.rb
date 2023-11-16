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
end
