require 'test_helper'

class BookCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get book_comments_index_url
    assert_response :success
  end

end
