require 'shrine'
require "cloudinary"
require "shrine/storage/cloudinary"

Cloudinary.config(
  cloud_name: "relimaster",
  api_key:    "263284285417456",
  api_secret: "QsZJM-JuALTG1girakeEYeaLAyg"
 
)

Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: "o_lms/images/cache"), # for direct uploads
  store: Shrine::Storage::Cloudinary.new(prefix: "o_lms/images/store")
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
