require 'test_helper'

class CalendarsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get calendars_edit_url
    assert_response :success
  end

end
