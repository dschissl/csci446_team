require 'test_helper'

class PetsControllerTest < ActionController::TestCase
  setup do
    @pet = pets(:one)
    @update = {
      name: 'Valid Name',
      age: 1.3,
      pet_type: 'Type',
      description: 'This is a test pet',
      image_url: 'image.jpg',
      status: 'Avaliable'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet" do
    assert_difference('Pet.count') do
      post :create, pet: @update
    end

    assert_redirected_to pet_path
  end

  test "should show pet" do
    get :show, id: @pet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pet
    assert_response :success
  end

  test "should update pet" do
    patch :update, id: @pet, pet: @update
    assert_redirected_to pet_path
  end

  test "should destroy pet" do
    assert_difference('Pet.count', -1) do
      delete :destroy, id: pets(:new)
    end

    assert_redirected_to pets_path
  end
end
