require 'test_helper'

class Therapists::AppointmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get therapists_appointments_edit_url
    assert_response :success
  end

  test "should get index" do
    get therapists_appointments_index_url
    assert_response :success
  end

end
