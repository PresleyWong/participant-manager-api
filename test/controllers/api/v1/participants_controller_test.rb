require "test_helper"

class Api::V1::ParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_participant = api_v1_participants(:one)
  end

  test "should get index" do
    get api_v1_participants_url, as: :json
    assert_response :success
  end

  test "should create api_v1_participant" do
    assert_difference("Api::V1::Participant.count") do
      post api_v1_participants_url, params: { api_v1_participant: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_participant" do
    get api_v1_participant_url(@api_v1_participant), as: :json
    assert_response :success
  end

  test "should update api_v1_participant" do
    patch api_v1_participant_url(@api_v1_participant), params: { api_v1_participant: {  } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_participant" do
    assert_difference("Api::V1::Participant.count", -1) do
      delete api_v1_participant_url(@api_v1_participant), as: :json
    end

    assert_response :no_content
  end
end
