require 'httparty'

class PendingMigrationNotifier
  attr_accessor :message

  def initialize(pending_migration_list)
    self.message = %Q(
      *There are pending migrations on #{ENV['HOST']}:*
      ```#{pending_migration_list}```
    )
  end

  def notify_on_slack
    response = HTTParty.post(
      ENV['SLACK_WEBHOOK_URL'],
      :headers => {
        'Content-Type' => 'application/json'
      },
      :body => {
        :channel => ENV['SLACK_CHANNEL'],
        :username => 'webhookbot',
        :text => self.message
      }.to_json
    )
    puts response
  end

end
