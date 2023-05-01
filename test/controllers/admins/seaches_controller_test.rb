require "test_helper"

class Admins::SeachesControllerTest < ActionDispatch::IntegrationTest
  test "should get seach" do
    get admins_seaches_seach_url
    assert_response :success
  end
end
