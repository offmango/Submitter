class User < ActiveRecord::Base
  
#  mount_uploader :userphoto, UserphotoUploader
  
  has_many :submissions, :dependent => :destroy
  
  
  has_attached_file :user_photo, 
    :styles => {
      :large_thumb => ["100x125>", :jpg],
      :small_thumb => ["20x25>", :jpg]
    }
  
  def user_submissions
    Submission.find_all_by_user_id(id, :order => "id DESC" )    
  end
  
end
