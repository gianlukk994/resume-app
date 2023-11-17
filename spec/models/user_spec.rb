# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#User' do
    subject { described_class.new(name: name, email: email) }
    let(:name) { 'Test' }
    let(:email) { 'test@test.com' }

    before do
      name
      email
    end

    context 'with valid attributes' do
      it 'is valid' do
        expect(subject).to be_valid
      end
    end

    context 'with invalid name' do
      let(:name) { nil }

      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end

    context 'with invalid email' do
      let(:email) { nil }

      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end

    describe 'associations' do
      it 'has many resumes' do
        expect(described_class.reflect_on_association(:resumes).macro).to eq :has_many
      end

      it 'has many employment_experiences' do
        expect(described_class.reflect_on_association(:employment_experiences).macro).to eq :has_many
      end

      it 'has many user_skills' do
        expect(described_class.reflect_on_association(:user_skills).macro).to eq :has_many
      end

      it 'has many skills' do
        expect(described_class.reflect_on_association(:skills).macro).to eq :has_many
      end
    end
  end
end
