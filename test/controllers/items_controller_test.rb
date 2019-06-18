# frozen_string_literal: true

require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test 'should get indax' do
    get items_indax_url
    assert_response :success
  end

  test 'should get show' do
    get items_show_url
    assert_response :success
  end

  test 'should get new' do
    get items_new_url
    assert_response :success
  end

  test 'should get create' do
    get items_create_url
    assert_response :success
  end

  test 'should get edit' do
    get items_edit_url
    assert_response :success
  end

  test 'should get update' do
    get items_update_url
    assert_response :success
  end

  test 'should get destoy' do
    get items_destoy_url
    assert_response :success
  end
end
