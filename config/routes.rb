Rails.application.routes.draw do

  get 'download/*asset_type/:asset_id/:thumb' => 'payload#download_payload', controller: :payload, as: :download_file

end
