class Violation < ActiveRecord::Base
  belongs_to :car
  has_one :city
  has_attached_file :image

  def image_url
    image.url
  end

end