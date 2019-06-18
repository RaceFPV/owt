require 'test_helper'

class TierControllerTest < ActionDispatch::IntegrationTest
  test "should get discord" do
    get tier_discord_url
    assert_response :success
  end

  test "should get harmony" do
    get tier_harmony_url
    assert_response :success
  end

end
