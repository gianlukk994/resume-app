# frozen_string_literal: true

# == Schema Information
#
# Table name: resume_skills
#
#  id         :integer          not null, primary key
#  skill_id   :integer          not null
#  resume_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe ResumeSkill, type: :model do
  subject { described_class.create!(resume_id: resume.id, skill_id: skill.id) }

  let(:user) { User.create(name: 'test', email: 'test@test.com') }
  let(:resume) { Resume.create(title: 'text', summary: 'text', user_id: user.id) }
  let(:skill) { Skill.create(category: 'soft', name: 'text') }

  before do
    user
    resume
    skill
  end

  context 'with valid attributes' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  describe 'when creating an already existing association resume-skill' do
    before { described_class.create!(resume_id: resume.id, skill_id: skill.id) }

    it 'raises an error' do
      expect { subject }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end

  describe 'associations' do
    it 'belongs to skill' do
      expect(described_class.reflect_on_association(:skill).macro).to eq :belongs_to
    end

    it 'belongs to resume' do
      expect(described_class.reflect_on_association(:resume).macro).to eq :belongs_to
    end
  end
end
