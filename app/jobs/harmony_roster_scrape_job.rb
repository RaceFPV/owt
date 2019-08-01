class HarmonyRosterScrapeJob < ActiveJob::Base
  queue_as :default

  def perform
    puts "Starting harmony scrape job..."
    session = GoogleDrive::Session.from_service_account_key(StringIO.new(ENV['SERVICE_ACCOUNT']))
    ws = session.spreadsheet_by_key("1oZA-RmtUFRVpo8OS9sNzaK9vRbsihkC9GFgzGvGS-HY").worksheets
    puts "Found spreadsheet, cycling through tabs...."
    puts "purging all player profiles---this is an ugly hack"
    Player.find_by_tier("harmony").delete_all
    puts "purging all team profiles---this is an ugly hack"
    Team.find_by_tier("harmony").delete_all
    ws.drop(1).each do |x|
      team_save(x)
      player_save(x)
    end
  end
  
  def team_save(x)
        puts "Processing team #{x.title}... creating entry"
        team = Team.new
        team.name = x.title
        sr = x[16, 4]
        if !sr.nil?
          team.sr = sr.to_i
        end
        team.gm = x[18, 1]
        team.captain = x[19, 1]
        team.coach = x[20, 1]
        team.discordname = x[21, 1]
        team.discordlink = x[21, 2]
        team.twittername = x[22, 1]
        team.twitterlink = x[22, 2]
        team.tier = "harmony"
        puts "Collected team data... saving"
        team.save!
        puts "Save complete"
    end
    
    
    
    def player_save(x)
      (6..15).each do |y|
        if !x[y, 1].empty?
            puts "Processing player #{x[y, 1]}... creating entry"
            player = Player.new
            player.name = x[y, 1]
            sr = x[y, 4]
            if !sr.nil?
              player.sr = sr.to_i
            end
            player.battletag = x[y, 2]
            player.role = x[y, 3]
            player.team_id = Team.find_by_name(x.title).id
            player.tier = "harmony"
            puts "Collected player data... saving"
            player.save!
            puts "Save complete"
        end
      end
    end
end


# teams schema
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
#    t.string "tier"

# players schema
#    t.integer "team_id", null: false
#    t.string "name"
#    t.string "battletag"
#    t.string "role"
#    t.integer "sr"
#    t.string "email"
#    t.string "tier"