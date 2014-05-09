Rails.application.routes.draw do

  get 'download/*asset_type/:asset_id' => 'payload#download_payload', controller: :payload, as: :download_file

end
