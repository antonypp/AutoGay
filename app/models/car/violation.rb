class Car::Violation < ActiveRecord::Base
  belongs_to :car
  has_many :comments
  attr_accessor :image_file_name, :image_content_type, :image_file_size
  has_attached_file :image,
                    :path => ":rails_root/public/system/:class/image/:id.:extension"
  attr_accessor :image_data
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
    data.original_filename = "image.png"
    data.content_type = "image/png"
    self.image = data
  end

  def judge(is_judge)
    if is_judge
      self.count_bad += 1
    else
      self.count_good +=1
    end
    save()
  end

end
