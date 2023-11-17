# frozen_string_literal: true

# == Schema Information
#
# Table name: resume_skills
#
#  id         :integer          not null, primary key
#  skill_id   :integer          not null
#  resume_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ResumeSkill < ApplicationRecord
  validates :id, uniqueness: { scope: %i[skill_id resume_id] }

  belongs_to :skill
  belongs_to :resume
end
