class HarmonyRosterScrapeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    session = GoogleDrive::Session.from_service_account_key(StringIO.new(ENV['SERVICE_ACCOUNT']))
    ws = session.spreadsheet_by_key("1FeXH7yDokCLiQjcjb14Pxq-gkHhKu49KDB6YZssHqGc").worksheets[1]
  end
end
