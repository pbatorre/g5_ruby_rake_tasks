class GroupMailer < ActionMailer::Base
  default to: ENV['MAILER_TO'],
          from: ENV['MAILER_FROM']

  def send(message)
    mail(
      content_type: 'text/html',
      body: body
    ).deliver
  end

end
