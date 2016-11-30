class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!
  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.where(user_id: current_user.id).order(created_at: :desc)
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @uploads = Upload.where(teacher_id: current_user.id)
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # GET /uploads/1/edit
  def edit
  end

  def student_uploads
    @uploads = Upload.where(teacher_id: current_user.id).order(created_at: :desc)
  end

  def student_show
    @uploads = Upload.where(user_id: current_user.id).order(created_at: :desc)
  end

  def create_upload_comment
    UploadComment.create(author: params[:author], comment_entry: params[:comment_entry], upload_id: params[:upload_id], user_id: params[:user_id])
    redirect_to :back
  end

  def edit_upload_comment
    upload_comment = UploadComment.find(params[:upload_comment_id])
    comment.update(comment_entry: params[:comment_entry])
    redirect_to upload_comment.upload
  end

  def delete_upload_comment
    UploadComment.find(params[:id]).destroy
    redirect_to :back
  end
  # POST /uploads
  # POST /uploads.json
  def create
    @upload = Upload.new(upload_params)

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:author, :description, :file, :user_id, :teacher_id, :video)
    end

end
