require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
        sign_in users(:john)
    end

    test 'create action should return success response' do
        post '/entries', params: {entry: {id: nil, post_id: nil}}, headers: {'Accept' => 'application/json'}
        data = JSON.parse(response.body)
        assert_response :success
        assert data.length > 0
        assert data['status'] == false
        assert_not data['errors'].empty?
    end

    test 'create action should return status is true if a post requested with valid params' do
        post '/entries', params: {:entry => {:id => nil, :post_id => posts(:one)}}, headers: {'Accept' => 'application/json'}
        data = JSON.parse(response.body)
        assert data['status'] == true
        assert data['errors'].empty?
    end

    test 'update action should return success response' do
        url = '/entries/'
        post url, params: {:entry => {:id => entries(:one), :post_id => nil, :entry_to => nil}}, headers: {'Accept' => 'application/json'}
        assert_response :success
        data = JSON.parse(response.body)
        assert data.length > 0
        assert data['status'] == false
        assert_not data['errors'].empty?
    end

    test 'update action should return status is true if a post requested with valid params' do
        url = '/entries/'
        post url, params: {:entry => {:id => entries(:one), :post_id => posts(:one), :entry_to => users(:john).id}}, headers: {'Accept' => 'application/json'}
        data = JSON.parse(response.body)
        assert data['status'] == true
        assert data['errors'].empty?
    end

end
