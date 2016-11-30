class Upload < ApplicationRecord
	belongs_to :user
	has_many :upload_comments

	has_attached_file :video, :styles => {
    :medium => { :geometry => "640x480", :format => 'mov' },
    :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }
  }, :processors => [:transcoder]

  validates_attachment_content_type :video, :content_type => ["video/quicktime", "video/mov"]

end
