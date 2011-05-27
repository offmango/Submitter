require 'carrierwave/processing/rmagick'
require 'RMagick2'

class Submission < ActiveRecord::Base

  belongs_to :user

  mount_uploader :portfolio, PortfolioUploader
  process_in_background :portfolio
  
  # after_save :enqueue     # queues up delayed_job for thumbnailing 
  
  
  
end
