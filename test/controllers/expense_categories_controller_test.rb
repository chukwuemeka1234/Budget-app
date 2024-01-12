require 'test_helper'

class ExpenseCategoriesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get expense_categories_new_url
    assert_response :success
  end

  test 'should get index' do
    get expense_categories_index_url
    assert_response :success
  end
end
