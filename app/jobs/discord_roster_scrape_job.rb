class DiscordRosterScrapeJob < ApplicationJob
  queue_as :default

  def perform
    puts "Starting discord scrape job..."
    session = GoogleDrive::Session.from_service_account_key(StringIO.new(ENV['SERVICE_ACCOUNT']))
    ws = session.spreadsheet_by_key("1FeXH7yDokCLiQjcjb14Pxq-gkHhKu49KDB6YZssHqGc").worksheets
    puts "Found spreadsheet, cycling through tabs...."
    ws.drop(1).each do |x|
      if Team.where(name: x.title).exists?
        puts "Team already exists, checking for updates"
        team = Team.where(name: x.title)
        team.sr ||= x[6, 4].to_i
        team.gm ||= x[18, 1]
        team.captain ||= x[19, 1]
        team.coach ||= x[20, 1]
        team.discordname ||= x[21, 1]
        team.discordlink ||= x[21, 2]
        team.twittername ||= x[22, 1]
        team.twitterlink ||= x[22, 2]
        puts "Collected team data... saving"
        team.save!
        puts "Save complete"
      else
        puts "Team #{x.title} not found... creating entry"
        team = Team.new
        team.name = x.title
        team.sr = x[6, 4].to_i
        team.gm = x[18, 1]
        team.captain = x[19, 1]
        team.coach = x[20, 1]
        team.discordname = x[21, 1]
        team.discordlink = x[21, 2]
        team.twittername = x[22, 1]
        team.twitterlink = x[22, 2]
        puts "Collected team data... saving"
        team.save!
        puts "Save complete"
      end
    end
  end
end

# teams schemaa
#    t.string "name"
#    t.integer "sr"
#    t.string "gm"
#    t.string "captain"
#    t.string "coach"
#    t.string "discordname"
#    t.string "discordlink"
#    t.string "twittername"
#    t.string "twitterlink"
#    t.string "affiliate"

# players schema
#    t.integer "team_id", null: false
#    t.string "name"
#    t.string "battletag"
#    t.string "role"
#    t.integer "sr"
#    t.string "email"