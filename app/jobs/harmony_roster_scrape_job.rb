class HarmonyRosterScrapeJob < ApplicationJob
  queue_as :default
  rescue_from(ErrorLoadingSite) do
    retry_job wait: 5.minutes, queue: :low_priority 
  end 

  def perform(*args)
    session = GoogleDrive::Session.from_config("config_harmony_roster.json")
    #ws = session.spreadsheet_by_key("1FeXH7yDokCLiQjcjb14Pxq-gkHhKu49KDB6YZssHqGc").worksheets[0]
  end
end
