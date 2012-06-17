# coding: UTF-8
class ViolationMailer < ActionMailer::Base

  default from: "public@me.ru"

  def send_msg(violation_id)
    email = "gbdd@gai.ru"
    @violation = Car::Violation.find(violation_id)
    image = @violation.image

    if image.present?
      attachments['violation.png'] = File.read(image.path)
    end

    mail(
      to:  email,
      subject: "Обращение по факту правонарушения"
    )
  end
end
