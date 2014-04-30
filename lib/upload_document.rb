module UploadDocument
  extend ActiveSupport::Concern

  included do
    mount_uploader  :payload, FileUploader

    default_scope { order('id ASC') }

    def name
      payload.file.filename rescue payload
    end

    def image?
      payload.file.content_type.include? 'image' rescue false
    end
  end
end
