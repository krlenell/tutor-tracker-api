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

  subject(:student) {FactoryBot.build(:student)}

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:minor)}

    it 'should validate adults have email and phone' do
      bad_adult = FactoryBot.build(:no_contact_adult_student)
      bad_adult.valid?
      expect(bad_adult.errors.messages_for(:minor)).to include("non-minor must have phone and email")
    end
  end


end
