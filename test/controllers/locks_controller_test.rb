require 'test_helper'

class LocksControllerTest < ActionController::TestCase
  setup do
    @lock = locks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locks)
  end

  test "should create lock" do
    assert_difference('Lock.count') do
      post :create, lock: { adminId: @lock.adminId, macAddress: @lock.macAddress }
    end

    assert_response 201
  end

  test "should show lock" do
    get :show, id: @lock
    assert_response :success
  end

  test "should update lock" do
    put :update, id: @lock, lock: { adminId: @lock.adminId, macAddress: @lock.macAddress }
    assert_response 204
  end

  test "should destroy lock" do
    assert_difference('Lock.count', -1) do
      delete :destroy, id: @lock
    end

    assert_response 204
  end
end
