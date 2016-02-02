class GroupMailer < ActionMailer::Base
  default to: ENV['MAILER_TO'],
          from: ENV['MAILER_FROM']

  def pending_migrations(pending_migration_list)
    body = %Q(
      **There are pending migrations on #{ENV['HOST']}:**
      [code]#{pending_migration_list}[/code]
    )

    mail content_type: 'text/html',
         body: body
  end

end
