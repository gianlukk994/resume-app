# frozen_string_literal: true

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
