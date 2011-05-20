class Submission < ActiveRecord::Base

  mount_uploader :portfolio, PortfolioUploader
  
  belongs_to :user
  
end
