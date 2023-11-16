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
require 'rails_helper'

RSpec.describe Skill, type: :model do
  subject { described_class.create!(category: category, name: name) }

  let(:category) { 'soft' }
  let(:name) { 'teamwork' }

  before do
    category
    name
  end

  context 'with valid attributes' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'with invalid category' do
    let(:category) { 'test' }

    it 'raises an error' do
      expect { subject }.to raise_error(ArgumentError, "'test' is not a valid category")
    end
  end

  describe 'when creating an already existing skill' do
    before { described_class.create!(category: category, name: name) }

    it 'raises an error' do
      expect { subject }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Name has already been taken')
    end
  end
end
