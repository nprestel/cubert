require 'test_helper'

class EquipmentControllerTest < ActionController::TestCase
  setup do
    @equipment = equipment(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equipment)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equipment" do
    assert_difference('Equipment.count') do
      post :create, equipment: { cb_limit_cuft: @equipment.cb_limit_cuft, description: @equipment.description, height1_ins: @equipment.height1_ins, height2_ins: @equipment.height2_ins, height3_ins: @equipment.height3_ins, image_url: @equipment.image_url, length1_ins: @equipment.length1_ins, length2_ins: @equipment.length2_ins, length3_ins: @equipment.length3_ins, mode: @equipment.mode, name: @equipment.name, width1_ins: @equipment.width1_ins, width2_ins: @equipment.width2_ins, width3_ins: @equipment.width3_ins, wt_limit_lbs: @equipment.wt_limit_lbs }
    end

    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should show equipment" do
    get :show, id: @equipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equipment
    assert_response :success
  end

  test "should update equipment" do
    patch :update, id: @equipment, equipment: { cb_limit_cuft: @equipment.cb_limit_cuft, description: @equipment.description, height1_ins: @equipment.height1_ins, height2_ins: @equipment.height2_ins, height3_ins: @equipment.height3_ins, image_url: @equipment.image_url, length1_ins: @equipment.length1_ins, length2_ins: @equipment.length2_ins, length3_ins: @equipment.length3_ins, mode: @equipment.mode, name: @equipment.name, width1_ins: @equipment.width1_ins, width2_ins: @equipment.width2_ins, width3_ins: @equipment.width3_ins, wt_limit_lbs: @equipment.wt_limit_lbs }
    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should destroy equipment" do
    assert_difference('Equipment.count', -1) do
      delete :destroy, id: @equipment
    end

    assert_redirected_to equipment_index_path
  end
end
