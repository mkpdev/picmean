class Blog < ApplicationRecord
  belongs_to :user, optional: true
  has_many :images

  #validates_presence_of :name, :title, :message

  def update_images(image_ids)
    Image.where(id: image_ids).update_all(blog_id: self.id)
  end
end
