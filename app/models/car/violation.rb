class Car::Violation < ActiveRecord::Base
  belongs_to :car
  has_one :city
  has_attached_file :image

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

    event :send do
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

end
