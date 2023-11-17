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
require 'rails_helper'

RSpec.describe UserSkill, type: :model do
  subject { described_class.create!(user_id: user.id, skill_id: skill.id) }

  let(:user) { User.create(name: 'test', email: 'test@test.com') }
  let(:skill) { Skill.create(category: 'soft', name: 'text') }

  before do
    user
    skill
  end

  context 'with valid attributes' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  describe 'when creating an already existing association user-skill' do
    before { described_class.create!(user_id: user.id, skill_id: skill.id) }

    it 'raises an error' do
      expect { subject }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end

  describe 'associations' do
    it 'belongs to skill' do
      expect(described_class.reflect_on_association(:skill).macro).to eq :belongs_to
    end

    it 'belongs to user' do
      expect(described_class.reflect_on_association(:user).macro).to eq :belongs_to
    end
  end
end
