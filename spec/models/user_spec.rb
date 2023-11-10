# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context '#User' do
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
  end
end