# == Schema Information
#
# Table name: students
#
#  id         :uuid             not null, primary key
#  active     :boolean          default(FALSE), not null
#  address    :string
#  email      :string
#  minor      :boolean          not null
#  name       :string           not null
#  phone      :string
#  school     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Student, type: :model do
  subject(:student) { FactoryBot.build(:student) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:minor) }

    it 'validates proper phone number' do
      good_student = FactoryBot.build(:student)
      expect(good_student).to be_valid
      bad_phone_minor = FactoryBot.build(:bad_phone_minor)
      expect(bad_phone_minor).not_to be_valid
    end

    it 'validates proper email address' do
      no_contact = FactoryBot.build(:no_contact_minor)
      expect(no_contact).to be_valid
      good_student = FactoryBot.build(:student)
      expect(good_student).to be_valid
      bad_email = FactoryBot.build(:bad_email_minor)
      expect(bad_email).not_to be_valid
    end

    it 'validates adults have email and phone' do
      no_contact_adult = FactoryBot.build(:no_contact_adult_student)
      no_contact_adult.valid?
      expect(no_contact_adult.errors.messages_for(:minor)).to include('non-minor must have phone and email')
    end
  end
end
