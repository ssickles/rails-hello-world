require 'faraday_middleware/aws_sigv4'

class LogsController < ApplicationController
  def index
    @opensearch_url = ENV['OPENSEARCH_URL']
    client = get_es_client
    # @result = client.cluster.health
    @result = client.search(
      index: 'games',
      body: {
        query: {
          match: {
            game_title: {
              query: 'Halo'
            }
          }
        }
      }
    )
  end

  def create
    games = [
      { 'id' => 1, 'game_title' => 'Halo: Combat Evolved', 'release_date' => '2003-09-30', 'platform' => 1, 'overview' => "In Halo's twenty-sixth century setting, the player assumes the role of the Master Chief, a cybernetically enhanced super-soldier. The player is accompanied by Cortana, an artificial intelligence who occupies the Master Chief's neural interface. Players battle various aliens on foot and in vehicles as they attempt to uncover the secrets of the eponymous Halo, a ring-shaped artificial planet.", 'youtube' => 'dR3Hm8scbEw', 'players' => 1, 'coop' => 'No', 'rating' => 'M - Mature', 'developers' => [1389, 3423], 'genres' => [1, 8], 'publishers' => [1], 'alternates' => nil, 'uids' => nil, 'hashes' => nil },
      { 'id' => 2, 'game_title' => 'Crysis', 'release_date' => '2007-11-13', 'platform' => 1, 'overview' => "From the makers of Far Cry, Crysis offers FPS fans the best-looking, most highly-evolving gameplay, requiring the player to use adaptive tactics and total customization of weapons and armor to survive in dynamic, hostile environments including Zero-G. \r\n\r\nEarth, 2019. A team of US scientists makes a frightening discovery on an island in the South China Sea. All contact with the team is lost when the North Korean Government quickly seals off the area. The United States responds by dispatching an elite team of Delta Force Operators to recon the situation. As tension rises between the two nations, a massive alien ship reveals itself in the middle of the island. The ship generates an immense force sphere that freezes a vast portion of the island and drastically alters the global weather system. Now the US and North Korea must join forces to battle the alien menace. With hope rapidly fading, you must fight epic battles through tropical jungle, frozen landscapes, and finally into the heart of the alien ship itself for the ultimate Zero G showdown.", 'youtube' => 'i3vO01xQ-DM', 'players' => 4, 'coop' => 'No', 'rating' => 'M - Mature', 'developers' => [1970], 'genres' => [8], 'publishers' => [2], 'alternates' => nil, 'uids' => nil, 'hashes' => nil },
      { 'id' => 4, 'game_title' => 'Star Fox 64', 'release_date' => '1997-06-30', 'platform' => 3, 'overview' => "The Lylat system has been invaded!  Join Fox McCloud and his Star Fox team as they fight to save the galaxy from the clutches of the evil Andross.  Travel to many different 3-D worlds.  Battle the enemy in the air and on the ground and listen in as Fox McCloud interacts with a cast of characters.\r\n\r\nSee how it feels to feel what you see!  The N64 Rumble Pak controller accessory instantly transmits all the bumps and blasts during the action.  It’s a new jolt to your game play experience!\r\n\r\n* Four Players compete simultaneously in Vs. mode!\r\n* Game Pak memory saves the top 10 scores!\r\n* Outstanding cinema scenes tell the Star Fox saga!", 'youtube' => 'jsEcmfPwnHo', 'players' => 4, 'coop' => 'No', 'rating' => 'E - Everyone', 'developers' => [6037], 'genres' => [1, 8], 'publishers' => [3], 'alternates' => ['Lylat Wars (EU)', 'Lylat Wars'], 'uids' => nil, 'hashes' => nil },
      { 'id' => 5, 'game_title' => 'Donkey Kong', 'release_date' => '1982-01-01', 'platform' => 7, 'overview' => "Can you save Mario's girl from the clutches of Donkey Kong? Donkey Kong has kidnapped Mario's girlfriend Pauline and taken her to the top of a construction site. It's up to you to help Mario save Pauline before time runs out. But it won't be easy. Donkey Kong will do everything in his power to stop you. He'll throw barrel bombs, flaming fireballs and anything else he can get his hands on. So if you're looking for action, don't monkey around. Get the original Donkey Kong from the Nintendo Arcade Classics Series!", 'youtube' => 'C_PrG8P5W8o', 'players' => 2, 'coop' => 'No', 'rating' => nil, 'developers' => [6037], 'genres' => [1], 'publishers' => [3], 'alternates' => nil, 'uids' => nil, 'hashes' => nil },
      { 'id' => 6, 'game_title' => 'Tapper', 'release_date' => '1983-01-01', 'platform' => 23, 'overview' => "The Tapper game screen features four bars. Patrons arrive periodically at the end of the bar opposite the player and demand drinks. The player must draw and serve drinks to the patrons as they slowly advance towards the player. If any customers reach the player's end of the bar, they impatiently grab the player-as-bartender and toss him out the far end of the bar, costing the player a life.[6]\r\n\r\nThe player serves customers by filling a mug at one of the four taps. Once the mug is full, the player releases the tap which automatically slides the mug towards the advancing customer. Customers catch mugs that are slid towards them, as long as they are not already drinking a beer, or otherwise distracted. If a mug is not caught by a customer (whether the customer is already drinking or distracted, or if there is no customer), then it falls off the bar on the other end, resulting in a loss of a life for the player. If a customer does catch the mug, though, then he or she is pushed back some amount towards the opposite end of the screen. The goal is to push the customer completely off the screen, but if they are not then they will stay and consume their drink in place. When a customer finishes his drink, he slides the empty mug back towards the player, after which the customer resumes his advance on the player. The player must collect the empty mugs before they reach the end of the bar and fall to the ground, as a mug falling to the ground costs a life.\r\n\r\nPeriodically, customers will leave tips on the bar for the player. These tips can be left at any place on the bar. The tip will appear after a specific number of empty mugs are released by the customers, and will appear wherever the customer who releases the required mug is standing. For example, in all levels, the first tip is left by the customer who returns the second empty mug, and will be left beside wherever this customer is standing. By collecting the tip, the player earns extra points and initiates \"entertainment\" for that level (dancing girls on the wild-west level, cheerleaders on the sports level, etc.). While the entertainment is active, some fraction of the customers will be distracted and stop advancing towards the player, but they will also stop catching mugs.\r\n\r\nTo complete a level the player must clear the entire bar of customers. Once this is done, the player is presented with a short vignette in which the bartender draws a drink for himself, drinks it, then tosses the empty mug into the air with varying (usually humorous) results, such as kicking it and shattering it or having the mug fall atop his head and cover it.\r\n\r\nAs the game progresses, the customers appear more frequently, move faster along the bar, and are pushed back shorter distances when they catch their drinks. In addition, the maximum number of customers per bar gradually increases until every bar can have up to four customers at a time.\r\n\r\nIn between levels of different settings, the player is presented with a shell game-type round. In this segue, the player is presented with a single bar that has six cans of beer or root beer sitting on top of it. A masked villain shakes every can except one and then pounds on the bar, causing the cans to shuffle their positions. If any other shaken can is picked, it explodes in the bartender/soda jerk's face, after which the right can is revealed. If the player selects the unshaken can, the hero is shown smiling and a message reads \"This Bud's For You\" (on the Budweiser version) or \"This one's for you\" (on Root Beer Tapper), and the player is rewarded with extra points.\r\n\r\nThere are four settings for the game, each setting lasting for two to four levels. The settings of the game are:\r\n\r\n-  A western bar with cowboys (2 levels)\r\n-  A sports bar with athletes (3 levels)\r\n-  A punk rock bar with punk rockers (4 levels)\r\n-  A space bar with aliens (4 levels)\r\n\r\nAfter completing all the levels, 13 in all, the player starts at the first again, harder than the first time through, and with some minor variations.", 'youtube' => 'dqrRKStaN_4', 'players' => 2, 'coop' => 'No', 'rating' => nil, 'developers' => [5280], 'genres' => [1], 'publishers' => [4], 'alternates' => ['Root Beer Tapper'], 'uids' => nil, 'hashes' => nil },
      { 'id' => 9, 'game_title' => 'Halo 2', 'release_date' => '2007-05-31', 'platform' => 1, 'overview' => 'Halo 2 is the sequel to the highly successful and critically acclaimed Halo®: Combat Evolved. In Halo 2, the saga continues as Master Chief—a genetically enhanced super-soldier—is the only thing standing between the relentless Covenant and the destruction of all humankind.', 'youtube' => 'Zz6FNKawJBc', 'players' => 2, 'coop' => 'No', 'rating' => 'M - Mature', 'developers' => [1389], 'genres' => [1, 8], 'publishers' => [1], 'alternates' => nil, 'uids' => nil, 'hashes' => nil },
      { 'id' => 10, 'game_title' => 'Ace Combat 6: Fires of Liberation', 'release_date' => '2007-10-23', 'platform' => 15, 'overview' => "Throughout Ace Combat 6, the player must pilot a fighter jet or other aircraft to destroy foes both in the air and on the ground. As an arcade flight game, it simplifies flight controls and gives the player a large amount of bullets, missiles and other weapons, putting them up against a very large amount of enemy forces. In addition to missiles and a vulcan cannon, the player can equip special weapons such as heat-seeking missiles, bombs, rocket launchers, and others. The player can lock on to a number of foes, and assist different tactical squads by switching between their respective HUD readouts.\r\n\r\nThe game includes 4 default multiplayer modes: Battle Royale, Siege Battle, Team Battle, and Co-Op Battle. In Battle Royale, the basic Deathmatch game mode, up to sixteen players shoot each other down to earn the highest points at the time limit. In Team Battle, a basic Team Deathmatch game is created. Points are awarded based on the type of aircraft destroyed. A unique type of multiplayer game, Siege Battle is played with two teams, Attacking and Defending. The Attacking team attempts to destroy the target (usually heavily defended by flak) within the time limit. The Defending team tries to halt their attack. The co-op battle mode consists of two single-player missions without AI that can be played with up to three other players.", 'youtube' => '', 'players' => 1, 'coop' => 'No', 'rating' => 'T - Teen', 'developers' => [5804], 'genres' => [13], 'publishers' => [6], 'alternates' => nil, 'uids' => nil, 'hashes' => nil },
    ]
    client = get_es_client
    unless client.indices.exists(index: 'games')
      client.indices.create(index: 'games')
    end
    client.bulk(
      body: games.map do |game|
        { index: { _index: 'games', data: game } }
      end
    )

    redirect_to logs_path
  end

  private

  def get_es_client
    Elasticsearch::Client.new(url: ENV['OPENSEARCH_URL']) do |f|
      f.request :aws_sigv4,
                service: 'es',
                region: ENV['AWS_REGION'],
                access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    end
  end
end
