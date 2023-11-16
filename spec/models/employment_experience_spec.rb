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
require 'rails_helper'

RSpec.describe EmploymentExperience, type: :model do
  describe 'associations' do
    it 'belongs to user' do
      expect(described_class.reflect_on_association(:user).macro).to eq :belongs_to
    end
  end
end
