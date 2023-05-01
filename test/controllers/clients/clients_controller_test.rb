require "test_helper"

class Clients::ClientsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get clients_clients_edit_url
    assert_response :success
  end

  test "should get show" do
    get clients_clients_show_url
    assert_response :success
  end

  test "should get withdrawal" do
    get clients_clients_withdrawal_url
    assert_response :success
  end
end
