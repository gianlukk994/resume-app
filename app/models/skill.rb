# frozen_string_literal: true

# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  category   :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Skill < ApplicationRecord
  enum category: %i[language soft technical]

  validates :name, presence: true, uniqueness: true
end
