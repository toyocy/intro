# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  last_name       :string
#  first_name      :string
#  email           :string           not null
#  is_active       :boolean          default("true")
#  organization_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_organization_id  (organization_id)
#

class User < ApplicationRecord
  belongs_to :organization
  accepts_nested_attributes_for :organization

  validates :last_name, length: { maximum: 50 }
  validates :first_name, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_senstive: false }
end
