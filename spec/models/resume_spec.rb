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
require 'rails_helper'

RSpec.describe Resume, type: :model do
  describe 'associations' do
    it 'belongs to users' do
      expect(described_class.reflect_on_association(:user).macro).to eq :belongs_to
    end

    it 'has many employment experiences' do
      expect(described_class.reflect_on_association(:employment_experiences).macro).to eq :has_many
    end
  end
end
