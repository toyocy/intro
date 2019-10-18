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

require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  def setup
    @org = organizations(:one)
  end

  test 'should be valid' do
    assert @org.valid?
  end

  test 'should be present' do
    @org.name = ' '
    assert_not @org.valid?
  end

  test 'should be unique' do
    dup_org = @org.dup
    dup_org.name = @org.name
    assert_not dup_org.valid?
  end
end
