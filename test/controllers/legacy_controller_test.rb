require 'test_helper'

class LegacyControllerTest < ActionDispatch::IntegrationTest
  test "should get one" do
    get legacy_one_url
    assert_response :success
  end

  test "should get two" do
    get legacy_two_url
    assert_response :success
  end

end
