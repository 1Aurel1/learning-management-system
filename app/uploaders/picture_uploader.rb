require "image_processing/mini_magick"

class PictureUploader < CarrierWave::Uploader::Base

    include Cloudinary::CarrierWave
  
    process :tags => ['hero_picture']
  
    version :standard do
      process :resize_to_fill => [100, 150, :north]
    end
  
    version :thumbnail do
      resize_to_fit(50, 50)
    end

    def extension_white_list
    %w(jpg jpeg gif png)
    end

    def root
        Rails.root.join 'public/'
    end

    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

  end