require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get Accueil" do
    get pages_Accueil_url
    assert_response :success
  end
end
