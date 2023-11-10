# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resume, type: :model do
  describe 'association' do
    it 'belongs to users' do
      expect(described_class.reflect_on_association(:user).macro).to eq :belongs_to
    end
  end
end
