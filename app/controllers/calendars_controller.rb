class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  # GET /calendars
  # GET /calendars.json
  def index
    @calendars = Calendar.where(user_id: current_user.id)
    @mondays = Calendar.where(day: "Monday", user_id: current_user.id).order(:start_time)
    @tuesdays = Calendar.where(day: "Tuesday", user_id: current_user.id).order(:start_time)
    @wednesdays = Calendar.where(day: "Wednesday", user_id: current_user.id).order(:start_time)
    @thursdays = Calendar.where(day: "Thursday", user_id: current_user.id).order(:start_time)
    @fridays = Calendar.where(day: "Friday", user_id: current_user.id).order(:start_time)
    @saturdays = Calendar.where(day: "Saturday", user_id: current_user.id).order(:start_time)
    @sundays = Calendar.where(day: "Sunday", user_id: current_user.id).order(:start_time)
  end

  def my_teacher_schedule
    @mondays = Calendar.where(day: "Monday", user_id: current_user.teacher_id).order(:start_time)
    @tuesdays = Calendar.where(day: "Tuesday", user_id: current_user.teacher_id).order(:start_time)
    @wednesdays = Calendar.where(day: "Wednesday", user_id: current_user.teacher_id).order(:start_time)
    @thursdays = Calendar.where(day: "Thursday", user_id: current_user.teacher_id).order(:start_time)
    @fridays = Calendar.where(day: "Friday", user_id: current_user.teacher_id).order(:start_time)
    @saturdays = Calendar.where(day: "Saturday", user_id: current_user.teacher_id).order(:start_time)
    @sundays = Calendar.where(day: "Sunday", user_id: current_user.teacher_id).order(:start_time)
  end
  # GET /calendars/1
  # GET /calendars/1.json
  def show
  end

  # GET /calendars/new
  def new
    @calendar = Calendar.new
  end

  # GET /calendars/1/edit
  def edit
  end

  # POST /calendars
  # POST /calendars.json
  def create
    @calendar = Calendar.new(calendar_params)

    respond_to do |format|
      if @calendar.save
        format.html { redirect_to @calendar, notice: 'Calendar was successfully created.' }
        format.json { render :show, status: :created, location: @calendar }
      else
        format.html { render :new }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendars/1
  # PATCH/PUT /calendars/1.json
  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to @calendar, notice: 'Calendar was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendar }
      else
        format.html { render :edit }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1
  # DELETE /calendars/1.json
  def destroy
    @calendar.destroy
    respond_to do |format|
      format.html { redirect_to calendars_url, notice: 'Calendar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_params
      params.require(:calendar).permit(:student_name, :location, :day, :start_time, :end_time, :user_id, :note)
    end
end
