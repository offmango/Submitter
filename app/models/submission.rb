# require 'carrierwave/processing/rmagick'
# require 'RMagick2'

class Submission < ActiveRecord::Base

  belongs_to :user


# USING PAPERCLIP / DELAYED_PAPERCLIP

  has_attached_file :portfolio, 
    :styles => {
      :large_thumb => "800x800>",
      :small_thumb => "300x300>"
    }
  
  process_in_background :portfolio

# USING CARRIERWAVE / CARRIERWAVE_BACKGROUNDER

#  mount_uploader :portfolio, PortfolioUploader
#  process_in_background :portfolio
  
  # after_save :enqueue     # queues up delayed_job for thumbnailing 
  
  
  
end
