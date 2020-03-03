require 'test_helper'

class DecksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get decks_index_url
    assert_response :success
  end

  test "should get show" do
    get decks_show_url
    assert_response :success
  end

end
