class User < ActiveRecord::Base
  
  mount_uploader :userphoto, UserphotoUploader
  
  has_many :submissions, :dependent => :destroy
  
end
