# frozen_string_literal: true

require 'test_helper'

class PortfoliosControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get portfolios_new_url
    assert_response :success
  end
end
