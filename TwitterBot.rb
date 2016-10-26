require 'rubygems'
require 'twitter'


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['consumer_key']
  config.consumer_secret     = ENV['consumer_secret']
  config.access_token        = ENV['access_token']
  config.access_token_secret = ENV['access_token_secret']
end

def run(client)


  searches = ["to:acorns", "to:futureadvisor", "to:wisebanyan", "to:stash", "to:robinhoodapp", "to:betterment", "to:wealthfront", "to:personalcapital", "to:hellodigit"]
  # puts @mentions into an array to be searched through
  # ids throwing errors: forusall401k jemstep captain401 honestdollar
  # errors most likely caused by lack of twitter activity

  ids = Array.new(150)
  ids = [791004978219397120, 790619955192532992, 791059582567190528, 790652479939682304, 791055783962091520, 791020136236974085, 791000782216626176, 789934336862674944, 790642905715208192, 788013480498589697, 787972171012247552, 787880994602909696, 787851630070861824, 787825830776930304, 787820107791601664, 787803560536903680, 787747840491683840, 787729806796419072, 787729458765660160, 787705324212019200, 787695528712605696, 787683630810173440, 787650156233711620, 787648547583778816, 787645963959754752, 787544693424984064, 787501441787236353, 787479269953777664, 787446205190209536, 787424678193266688, 787423248409657344, 787415744476770304, 787412248952238081, 787401997834223616, 787389517607174145, 787384339881463808, 787383741605900289, 787378897302106112, 787371217665728512, 787368633555189760, 787364403586805760, 787361883070173184, 787352244395970560, 787329269814947840, 787311731995475970, 787311897641099264, 787309593974050816, 787307579613573121, 787304961696788480, 787110724237754368, 786943865068617728, 787062462952595456, 787275313839476736, 787285902376611845, 787058325146001410, 784460958982889473, 786245835826667520, 787098901216059392, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
  
  while true
    searches.each do |search|
      puts "----searching----"
      
      re = client.search(search).first.id # returns the ID of the first tweet in the list, if the  ID equals an already retweeted value, then it throws error
      puts "checking: #{search} id: #{re}"

      # client.retweet(re); 
      # puts "Retweet: #{re} #{Time.now}";  

      puts "#{ids}"
      
      if ids.include? (re)
        puts "Tweet already tweeted."
      else
        client.retweet(re) 
        puts "Retweet: #{re} #{Time.now}"
        ids.unshift(re) 
        puts "#{ids}"
      end
    end
    
    puts "---------------break-----------------"
    sleep(300); #sleep for 5 minutes
  end

end

run(client);