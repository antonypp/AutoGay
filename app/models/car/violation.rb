class Car::Violation < ActiveRecord::Base
  belongs_to :car
  has_one :city
  has_attached_file :image
  attr_accessor :image_data
  attr_accessor :image_type
  before_validation :decode_image_data,
                    :if => :image_data_provided?

  state_machine :initial => :queried do

    state :queried
    state :new
    state :sent
    state :sent_by_client
    state :solved
    state :closed

    event :completion do
      transition :queried => :new
    end

    event :send_by_server do
      transition :new => :sent
    end

    event :send_by_client do
      transition :new => :send_by_client
    end

    event :solve do
      transition :sent => :solved, :sent_by_client => :solved
    end

    event :close do
      transition :new => :closed
    end

  end

  def image_url
    image.url
  end

  private

  def image_data_provided?
    !self.image_data.blank?
  end

  def decode_image_data
    # If image_data is set, decode it and hand it over to Paperclip
    data = StringIO.new(Base64.decode64(self.image_data))
    data.class.class_eval { attr_accessor :original_filename, :content_type }
    data.original_filename = "image.#{self.image_type}"
    data.content_type = "image/#{self.image_type}"
    self.image = data
  end

end
