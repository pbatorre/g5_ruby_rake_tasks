require 'slack-notifier'
require 'redcarpet'

class PendingMigrationNotifier
  attr_accessor :message

  def initialize(pending_migration_list)
    self.message = %Q(
      **There are pending migrations on #{ENV['HOST']}:**
      [code]#{pending_migration_list}[/code]
    )
  end

  def send
    case ENV['CHAT_CLIENT']
    when 'Slack'
      notify_on_slack
    when 'Glip'
      GroupMailer.send(pending_migrations)
    end
  end

  private

  def notify_on_slack
    slack_notifier = Slack::Notifier.new(
      ENV['SLACK_WEBHOOK_URL'],
      channel: ENV['SLACK_CHANNEL'],
      username: ENV['SLACK_USERNAME']
    )

    slack_notifier.ping formatted_slack_message
  end

  def formatted_slack_message
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render self.message
  end

end
