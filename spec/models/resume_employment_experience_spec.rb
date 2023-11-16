# frozen_string_literal: true

# == Schema Information
#
# Table name: resume_employment_experiences
#
#  id                       :integer          not null, primary key
#  resume_id                :integer          not null
#  employment_experience_id :integer          not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
require 'rails_helper'

RSpec.describe ResumeEmploymentExperience, type: :model do
  describe 'associations' do
    it 'belongs to resume' do
      expect(described_class.reflect_on_association(:resume).macro).to eq :belongs_to
    end

    it 'belongs to employment_experience' do
      expect(described_class.reflect_on_association(:employment_experience).macro).to eq :belongs_to
    end
  end
end
