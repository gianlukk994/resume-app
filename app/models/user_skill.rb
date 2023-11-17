# frozen_string_literal: true

# == Schema Information
#
# Table name: user_skills
#
#  id         :integer          not null, primary key
#  skill_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserSkill < ApplicationRecord
  validates :id, uniqueness: { scope: %i[skill_id user_id] }

  belongs_to :skill
  belongs_to :user
end
