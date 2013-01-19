class Attachment < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  mount_uploader :file, FileUploader

  belongs_to :project

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:file),
      "size" => file.size,
      "url" => file.url,
#      "thumbnail_url" => avatar.thumb.url,
      "delete_url" => attachment_path(:id => id),
      "delete_type" => "DELETE"
    }
  end
end
