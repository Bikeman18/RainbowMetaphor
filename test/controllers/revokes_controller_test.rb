require 'test_helper'

class RevokesControllerTest < ActionController::TestCase
  setup do
    @revoke = revokes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:revokes)
  end

  test "should create revoke" do
    assert_difference('Revoke.count') do
      post :create, revoke: { key_id: @revoke.key_id, user_id: @revoke.user_id }
    end

    assert_response 201
  end

  test "should show revoke" do
    get :show, id: @revoke
    assert_response :success
  end

  test "should update revoke" do
    put :update, id: @revoke, revoke: { key_id: @revoke.key_id, user_id: @revoke.user_id }
    assert_response 204
  end

  test "should destroy revoke" do
    assert_difference('Revoke.count', -1) do
      delete :destroy, id: @revoke
    end

    assert_response 204
  end
end
