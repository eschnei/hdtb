require 'rubygems'
require 'twitter'


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['consumer_key']
  config.consumer_secret     = ENV['consumer_secret']
  config.access_token        = ENV['access_token']
  config.access_token_secret = ENV['access_token_secret']
end

def run(client)


  searches = ["to:name of twitter account"]
  # puts @mentions into an array to be searched through
  # errors most likely caused by lack of twitter activity

  ids = Array.new(150)
  ids = []
  # create an array of tweet ids that have already been tweeted.
  
  while true
    searches.each do |search|
      puts "----searching----"
      
      re = client.search(search).first.id # returns the ID of the first tweet in the list, if the  ID equals an already retweeted value, then it throws error
      puts "checking: #{search} id: #{re}"

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
