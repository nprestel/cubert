require 'test_helper'

class ShipmentsControllerTest < ActionController::TestCase
  setup do
    @shipment = shipments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipment" do
    assert_difference('Shipment.count') do
      post :create, shipment: { cb_util: @shipment.cb_util, equiptype: @shipment.equiptype, gross_volume_cuft: @shipment.gross_volume_cuft, gross_weight_lbs: @shipment.gross_weight_lbs, pieces_count: @shipment.pieces_count, wt_util: @shipment.wt_util }
    end

    assert_redirected_to shipment_path(assigns(:shipment))
  end

  test "should show shipment" do
    get :show, id: @shipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipment
    assert_response :success
  end

  test "should update shipment" do
    patch :update, id: @shipment, shipment: { cb_util: @shipment.cb_util, equiptype: @shipment.equiptype, gross_volume_cuft: @shipment.gross_volume_cuft, gross_weight_lbs: @shipment.gross_weight_lbs, pieces_count: @shipment.pieces_count, wt_util: @shipment.wt_util }
    assert_redirected_to shipment_path(assigns(:shipment))
  end

  test "should destroy shipment" do
    assert_difference('Shipment.count', -1) do
      delete :destroy, id: @shipment
    end

    assert_redirected_to shipments_path
  end
end
