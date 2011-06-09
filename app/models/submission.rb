# require 'carrierwave/processing/rmagick'
# require 'RMagick2'

class Submission < ActiveRecord::Base

  belongs_to :user


# USING PAPERCLIP / DELAYED_PAPERCLIP

  has_attached_file :portfolio, 
    :storage => :filesystem,
    :path => ":rails_root/public/uploads/:attachment/:id/:basename_:style.:extension",
    :url => "/uploads/:attachment/:id/:basename_:style.:extension",
    :default_url => "/uploads/:attachment/default/default_:style.png",
    :styles => {
      :large_thumb => ["800x800>", :png],
      :small_thumb => ["300x300>", :png]
    }
  
  process_in_background :portfolio
  
  
end
