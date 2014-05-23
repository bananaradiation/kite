require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  test "should get get_activities" do
    get :get_activities
    assert_response :success
  end

end
