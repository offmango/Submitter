# encoding: utf-8

# require File.join(Rails.root, "lib", "carrier_wave", "delayed_job") # ties in delayed_job module for thumbnailing 

class PortfolioUploader < CarrierWave::Uploader::Base

#  include CarrierWave::Delayed::Job   
# testing a background solution detailed here: http://www.freezzo.com/2011/01/06/how-to-use-delayed-job-to-handle-your-carrierwave-processing/

  include ::CarrierWave::Backgrounder::DelayStorage  # https://github.com/lardawge/carrierwave_backgrounder


  # Include RMagick or ImageScience support:
  include CarrierWave::RMagick
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end
  
  # def smallthumb
  #    resize(200,200)
  #  end
    
  #  def largethumb
  #    resize(800,800)
  #  end
  
  
  
  #  NEED TO CHANGE THIS SO THAT FILE IS CONVERTED TO PNG/GIF, THEN THUMBNAILED
  
  #  ALSO NEED TO CHANGE FILE NAME AND LOCATION TO MATCH UP WITH CURRENT SYSTEM

 
    version :small_thumb do
      process :convert => 'png'
      process :scale => [200, 200]
    end
    
    def convert_to_png
      img = Magick::ImageList.new("#{current_path}[0]").first
      thumb = img.scale(100, 100)
      new_path = current_path.sub(/pdf/, 'png')
      thumb.write "#{new_path}" 
    end
      
#    version :large_thumb do
#      process :resize_to_fit => [800, 800]
#    end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
