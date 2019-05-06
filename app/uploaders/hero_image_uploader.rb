require "image_processing/mini_magick"
require 'RMagick'
class HeroImageUploader < CarrierWave::Uploader::Base

    include Cloudinary::CarrierWave
    include Magick
    
    process :convert => 'png'
    process :tags => ['hero_picture']
  
    version :standard do
      process :resize_to_fill => [100, 150, :north]
    end
  
    version :thumbnail do
      resize_to_fit(50, 50)
    end

    def default_url
        "/assets/heroes/" + [filename].compact.join('_')
    end
  
    def root
        Rails.root.join 'public/'
    end

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

  end