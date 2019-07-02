class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
   retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::
  
  # Enqueue a job to be performed tomorrow at noon.
  DiscordRosterScrapeJob.set(wait_until: (DateTime.now + 10.minutes)).perform_later
  HarmonyRosterScrapeJob.set(wait_until: (DateTime.now + 12.minutes)).perform_later
end
