require 'test_helper'

class TeacherMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_message = teacher_messages(:one)
  end

  test "should get index" do
    get teacher_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_message_url
    assert_response :success
  end

  test "should create teacher_message" do
    assert_difference('TeacherMessage.count') do
      post teacher_messages_url, params: { teacher_message: { author: @teacher_message.author, teacher_message_entry: @teacher_message.teacher_message_entry, title: @teacher_message.title, user_id: @teacher_message.user_id } }
    end

    assert_redirected_to teacher_message_url(TeacherMessage.last)
  end

  test "should show teacher_message" do
    get teacher_message_url(@teacher_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_message_url(@teacher_message)
    assert_response :success
  end

  test "should update teacher_message" do
    patch teacher_message_url(@teacher_message), params: { teacher_message: { author: @teacher_message.author, teacher_message_entry: @teacher_message.teacher_message_entry, title: @teacher_message.title, user_id: @teacher_message.user_id } }
    assert_redirected_to teacher_message_url(@teacher_message)
  end

  test "should destroy teacher_message" do
    assert_difference('TeacherMessage.count', -1) do
      delete teacher_message_url(@teacher_message)
    end

    assert_redirected_to teacher_messages_url
  end
end
