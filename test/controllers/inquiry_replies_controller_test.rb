# frozen_string_literal: true

require 'test_helper'

class InquiryRepliesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get inquiry_replies_new_url
    assert_response :success
  end

  test 'should get create' do
    get inquiry_replies_create_url
    assert_response :success
  end

  test 'should get show' do
    get inquiry_replies_show_url
    assert_response :success
  end
end
