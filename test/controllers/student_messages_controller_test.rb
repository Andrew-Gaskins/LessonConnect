require 'test_helper'

class StudentMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_message = student_messages(:one)
  end

  test "should get index" do
    get student_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_student_message_url
    assert_response :success
  end

  test "should create student_message" do
    assert_difference('StudentMessage.count') do
      post student_messages_url, params: { student_message: { author: @student_message.author, student_message_entry: @student_message.student_message_entry, title: @student_message.title, user_id: @student_message.user_id } }
    end

    assert_redirected_to student_message_url(StudentMessage.last)
  end

  test "should show student_message" do
    get student_message_url(@student_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_message_url(@student_message)
    assert_response :success
  end

  test "should update student_message" do
    patch student_message_url(@student_message), params: { student_message: { author: @student_message.author, student_message_entry: @student_message.student_message_entry, title: @student_message.title, user_id: @student_message.user_id } }
    assert_redirected_to student_message_url(@student_message)
  end

  test "should destroy student_message" do
    assert_difference('StudentMessage.count', -1) do
      delete student_message_url(@student_message)
    end

    assert_redirected_to student_messages_url
  end
end
