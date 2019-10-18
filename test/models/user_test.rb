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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @org = organizations(:one)
    @user = users(:one)
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'email should be present' do
    @user.email = ' '
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.email = 'A' * 244 + '@example.com'
    assert_not @user.valid?
  end

  test 'email should be unique' do
    dup_user = @user.dup
    dup_user.email = @user.email
    assert_not dup_user.valid?
  end


  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                          foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'last name should not be too long' do
    @user.last_name = 'A' * 51
    assert_not @user.valid?
  end

  test 'first name should not be too long' do
    @user.first_name = 'A' * 51
    assert_not @user.valid?
  end

end
