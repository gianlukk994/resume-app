# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmploymentExperience, type: :model do
  describe 'associations' do
    it 'belongs to user' do
      expect(described_class.reflect_on_association(:user).macro).to eq :belongs_to
    end
  end
end
