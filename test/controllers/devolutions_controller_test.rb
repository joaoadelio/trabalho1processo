require 'test_helper'

class DevolutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @devolution = devolutions(:one)
  end

  test "should get index" do
    get devolutions_url
    assert_response :success
  end

  test "should get new" do
    get new_devolution_url
    assert_response :success
  end

  test "should create devolution" do
    assert_difference('Devolution.count') do
      post devolutions_url, params: { devolution: { devolutionDate: @devolution.devolutionDate } }
    end

    assert_redirected_to devolution_url(Devolution.last)
  end

  test "should show devolution" do
    get devolution_url(@devolution)
    assert_response :success
  end

  test "should get edit" do
    get edit_devolution_url(@devolution)
    assert_response :success
  end

  test "should update devolution" do
    patch devolution_url(@devolution), params: { devolution: { devolutionDate: @devolution.devolutionDate } }
    assert_redirected_to devolution_url(@devolution)
  end

  test "should destroy devolution" do
    assert_difference('Devolution.count', -1) do
      delete devolution_url(@devolution)
    end

    assert_redirected_to devolutions_url
  end
end
