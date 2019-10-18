# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :string
#  is_active  :boolean          default("true")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organization < ApplicationRecord
  has_many :users, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
end
