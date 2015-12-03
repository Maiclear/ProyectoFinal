require 'test_helper'

class OnGsControllerTest < ActionController::TestCase
  setup do
    @ong = ongs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ongs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ong" do
    assert_difference('Ong.count') do
      post :create, ong: { description: @ong.description, image: @ong.image, mail: @ong.mail, name: @ong.name, user_id: @ong.user_id }
    end

    assert_redirected_to ong_path(assigns(:ong))
  end

  test "should show ong" do
    get :show, id: @ong
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ong
    assert_response :success
  end

  test "should update ong" do
    patch :update, id: @ong, ong: { description: @ong.description, image: @ong.image, mail: @ong.mail, name: @ong.name, user_id: @ong.user_id }
    assert_redirected_to ong_path(assigns(:ong))
  end

  test "should destroy ong" do
    assert_difference('Ong.count', -1) do
      delete :destroy, id: @ong
    end

    assert_redirected_to ongs_path
  end
end
