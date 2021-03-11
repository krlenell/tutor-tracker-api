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
class Student < ApplicationRecord

  validates :name, :minor, presence: true
  validate :non_minor_needs_phone_and_email
  validates :phone, phone: {possible: true, allow_blank: true}

  private
  def non_minor_needs_phone_and_email
    if minor == false && !(phone && email)
      errors.add(:minor, "non-minor must have phone and email")
    end
  end


end
