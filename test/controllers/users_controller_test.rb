require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = User.create({ first_name: "Donald", last_name: "Trump" })
  end

  test "should get index" do
    get :index
    assert_response :success

    @user = User.create({ first_name: "Barak", last_name: "Obama" })

    res = get_json @response

    assert_equal(2, res.count)
  end
end
