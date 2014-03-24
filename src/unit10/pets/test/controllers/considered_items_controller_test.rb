require 'test_helper'

class ConsideredItemsControllerTest < ActionController::TestCase
  setup do
    @considered_item = considered_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:considered_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create considered_item" do
    assert_difference('ConsideredItem.count') do
      post :create, considered_item: { consideration_id: @considered_item.consideration_id, pet_id: @considered_item.pet_id }
    end

    assert_redirected_to animals_path
  end

  test "should show considered_item" do
    get :show, id: @considered_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @considered_item
    assert_response :success
  end

  test "should update considered_item" do
    patch :update, id: @considered_item, considered_item: { consideration_id: @considered_item.consideration_id, pet_id: @considered_item.pet_id }
    assert_redirected_to considered_item_path(assigns(:considered_item))
  end

  test "should destroy considered_item" do
    assert_difference('ConsideredItem.count', -1) do
      delete :destroy, id: @considered_item
    end

    assert_redirected_to considered_items_path
  end
end
