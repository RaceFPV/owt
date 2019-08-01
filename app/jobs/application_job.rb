class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
   retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::
  
  # Enqueue a job to be performed tomorrow at noon.
  DiscordRosterScrapeJob.set(wait_until: (DateTime.now + 20.minutes)).perform_later
  HarmonyRosterScrapeJob.set(wait_until: (DateTime.now + 21.minutes)).perform_later
  #DiscordRosterScrapeJob.perform_later
  #HarmonyRosterScrapeJob.perform_later
end
