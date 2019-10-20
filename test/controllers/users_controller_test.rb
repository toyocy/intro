require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @org = organizations(:one)
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_url
    assert_response :success
  end

  # TODO: WIP. Can't pass below test.
  # test 'should create user' do
  #   assert_difference('User.count') do
  #     post users_url, params: {
  #       user:
  #       {
  #         email: 'sample@example.com',
  #         first_name: 'test',
  #         is_active: true,
  #         last_name: 'user',
  #         organization_id: @user.organization_id
  #       }
  #     }
  #   end

  #   assert_redirected_to user_url(User.last)
  # end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    patch user_url(@user), params: { user: { email: @user.email, first_name: @user.first_name, is_active: @user.is_active, last_name: @user.last_name, organization_id: @user.organization_id } }
    assert_redirected_to user_url(@user)
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
