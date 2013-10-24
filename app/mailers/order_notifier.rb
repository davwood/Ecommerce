class OrderNotifier < ActionMailer::Base
  default from: "from@example.com"

  def confirmation_email(number_of_items)
    @number_of_items = number_of_items

    mail(to: 'margo@margonline.co.uk', subject: 'Order confirmation')
  end


end
