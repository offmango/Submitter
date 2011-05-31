class User < ActiveRecord::Base
  
#  mount_uploader :userphoto, UserphotoUploader
  
  has_many :submissions, :dependent => :destroy
  
  def user_submissions
    Submission.find_all_by_user_id(id, :order => "id DESC" )    
  end
  
end
