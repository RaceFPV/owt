require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get discord" do
    get teams_discord_url
    assert_response :success
  end

  test "should get harmony" do
    get teams_harmony_url
    assert_response :success
  end

end
