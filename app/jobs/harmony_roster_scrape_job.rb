class HarmonyRosterScrapeJob < ApplicationJob
  queue_as :default

  def perform
    puts "Starting discord scrape job..."
    session = GoogleDrive::Session.from_service_account_key(StringIO.new(ENV['SERVICE_ACCOUNT']))
    ws = session.spreadsheet_by_key("1oZA-RmtUFRVpo8OS9sNzaK9vRbsihkC9GFgzGvGS-HY").worksheets
    puts "Found spreadsheet, cycling through tabs...."
    ws.drop(1).each do |x|
      team_save(x)
      player_save(x)
    end
  end
  
  def team_save(x)
      if Team.where(name: x.title).exists?
        puts "Team already exists, checking for updates"
        team = Team.find_by_name(x.title)
        sr = x[16, 4]
        if !sr.nil? and team.sr.nil?
          team.sr = sr.to_i
        elsif !sr.nil?
          team.sr ||= sr.to_i
        end
        team.gm ||= x[18, 1]
        team.captain ||= x[19, 1]
        team.coach ||= x[20, 1]
        team.discordname ||= x[21, 1]
        team.discordlink ||= x[21, 2]
        team.twittername ||= x[22, 1]
        team.twitterlink ||= x[22, 2]
        puts "Collected team data..."
        if team.changed?
          puts "Team #{x.title} data changed, saving changes..."
          team.save!
        else  
          puts "Team #{x.title} data not changed"
        end
        puts "Check for #{x.title} complete"
      else
        puts "Team #{x.title} not found... creating entry"
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
        puts "Collected team data... saving"
        team.save!
        puts "Save complete"
      end
    end
    
    
    
    def player_save(x)
      (6..15).each do |y|
        if !x[y, 1].empty?
          if Player.where(name: x[y, 1]).exists?
            puts "Player #{x[y, 1]} already exists, checking for updates"
            player = Player.find_by_name(x[y, 1])
            sr = x[y, 4]
            if !sr.nil? and player.sr.nil?
              player.sr = sr.to_i
            elsif !sr.nil?
              player.sr ||= sr.to_i
            end
            player.battletag ||= x[y, 2]
            player.role ||= x[y, 3]
            player.team_id ||= Team.find_by_name(x.title).id
            puts "Collected player data..."
            if player.changed?
              puts "Player #{x[y, 1]} data changed, saving changes..."
              team.save!
            else  
              puts "Player #{x[y, 1]} data not changed"
            end
            puts "Check for #{x[y, 1]} complete"
          else
            puts "Player #{x[y, 1]} not found... creating entry"
            player = Player.new
            player.name = x[y, 1]
            sr = x[y, 4]
            if !sr.nil?
              player.sr = sr.to_i
            end
            player.battletag ||= x[y, 2]
            player.role ||= x[y, 3]
            player.team_id ||= Team.find_by_name(x.title).id
            puts "Collected player data... saving"
            player.save!
            puts "Save complete"
          end
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

# players schema
#    t.integer "team_id", null: false
#    t.string "name"
#    t.string "battletag"
#    t.string "role"
#    t.integer "sr"
#    t.string "email"