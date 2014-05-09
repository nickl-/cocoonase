module UploadDocument
  extend ActiveSupport::Concern

  included do
    mount_uploader  :payload, FileUploader

    default_scope { order('id ASC') }

    def name
      payload.file.filename rescue payload
    end

    def payload_url
      Rails.application.routes.url_helpers.download_file_path(ERB::Util.url_encode(payload.model.class), payload.model.id, 0)
    end

    def payload_thumb
      Rails.application.routes.url_helpers.download_file_path(ERB::Util.url_encode(payload.model.class), payload.model.id, 1)
    end

    def image?
      payload.image? rescue false
    end
  end
end
