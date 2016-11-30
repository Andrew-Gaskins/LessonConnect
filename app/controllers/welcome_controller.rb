class WelcomeController < ApplicationController
  
  def index

    if user_signed_in?
      @my_students = User.where(teacher_id:current_user.id).order(:name)
    end
  end

  def new_student
  	@student = User.new
  end

  def create_student
  	@student = User.create(name: params[:name], teacher_id: params[:teacher_id], email: params[:email], password: params[:password], user_type: params[:user_type], instrument: params[:instrument])
  	redirect_to root_path
  end

  def new_teacher
  	@teacher = User.new
  end

  def create_teacher
  	@student = User.create(name: params[:name], email: params[:email], password: params[:password], user_type: params[:user_type])
  	redirect_to root_path
  end

end
