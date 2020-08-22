require 'test_helper'

class TechnologiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get technologies_show_url
    assert_response :success
  end

  test "should get new" do
    get technologies_new_url
    assert_response :success
  end

  test "should get create" do
    get technologies_create_url
    assert_response :success
  end

end
