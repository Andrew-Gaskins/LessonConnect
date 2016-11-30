class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :mailbox, :conversation

  private

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def mailbox
  	@mailbox ||= current_user.mailbox
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_type, :following])

   	devise_parameter_sanitizer.permit(:account_update, keys: [:name, :user_type, :following])
  end
end
