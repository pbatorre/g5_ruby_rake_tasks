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
    when 'Glip'
      GroupMailer.send(pending_migrations)
    end
  end

end
