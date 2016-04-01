require 'helpers/pending_migration_notifier'

namespace 'g5:workflow' do
  desc 'Sends an email to group if there are pending migrations'
  task notify_pending_migrations: :environment do
    notify_pending_migrations if needs_migration?
  end

  def needs_migration?
    begin
      ActiveRecord::Migration.check_pending!
      false
    rescue ActiveRecord::PendingMigrationError
      true
    end
  end

  def notify_pending_migrations
    pending_migrations = %x{ rake db:migrate:status | grep down }
    pending_migrations.gsub!(/\bdown\b/, '')

    notifier = PendingMigrationNotifier.new(pending_migrations)
    notifier.notify_on_slack
  end

end
