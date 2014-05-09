class PayloadController < ::ApplicationController
  include ActionView::Helpers::UrlHelper

  def download_payload
    asset = params[:asset_type].classify.constantize.find(params[:asset_id])
    send_file(params[:thumb] ? asset.payload.thumb.path : asset.payload.path, disposition: 'inline', url_based_filename: false)
  end
end
