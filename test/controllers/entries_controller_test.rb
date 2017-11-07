require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
        sign_in users(:john)
    end

    test 'should return success response if a post requested' do
        post '/entries', params: {entry: {post_id: nil}}, headers: {'Accept' => 'application/json'}
        puts response.body
        data = JSON.parse(response.body)
        assert_response :success
        assert data.length > 0
        assert data['status'] == false
    end

    test 'should status is false if an invalid post requested' do
        post '/entries', params: {:entry => {:post_id => posts(:one)}}, headers: {'Accept' => 'application/json'}
        data = JSON.parse(response.body)
        assert data['status'] == true
    end
end
