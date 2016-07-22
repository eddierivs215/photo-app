class Image < ActiveRecord::Base
  has_many :user_images
  has_many :users, through: :user_images
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  
  private 
  
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
  
end
