require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.every '1d' do
  Rails.logger.info "SCHEDULER --- Start stale session cleanup [#{Time.now}]"
  SessionGroup.cleanup_stale_sessions
end
