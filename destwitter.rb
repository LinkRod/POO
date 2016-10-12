# https://www.distilled.net/resources/web-scraping-with-ruby-and-nokogiri-for-beginners/
# https://blog.engineyard.com/2010/getting-started-with-nokogiri

require 'Nokogiri'
require 'open-uri'

class TwitterScrapper
  def initialize(url)
    @doc = Nokogiri::HTML(File.open(url))
    @place = ""
    @bio = ""
    @target = ""
    @stats = []
    @name = ""
    @tweets = []
    @fechas = []
    @rtwfav = []
  end

  def extract_username
   @name = @doc.search(".ProfileHeaderCard-nameLink").first.inner_text
  end

   def extract_target
    @target = @doc.search(".ProfileHeaderCard-screennameLink").inner_text
  end

  def extract_bio
    @bio = @doc.search(".ProfileHeaderCard-bio").inner_text
  end

  def extract_place
    @place = @doc.search(".ProfileHeaderCard-locationText").inner_text
  end

  def extract_tweets
    @doc.xpath('//small[@class="time"]').each do |x|
      @fechas << x.inner_text.gsub(/\n/,"").lstrip 
    end
    @doc.xpath('//div[@class="js-tweet-text-container"]').each do |x|
      @tweets << x.text.gsub(/\n/,"").lstrip 
    end
    @doc.xpath('//span[@class="ProfileTweet-actionCountForPresentation"]').each do |x|
      @rtwfav << x.text
    end
    @rtwfav = @rtwfav.values_at(* @rtwfav.each_index.select {|i|i.even?})
  end

  def extract_stats
    @doc.xpath('//span[@class="ProfileNav-value"]').each do |x|
      @stats << x.text
    end
  end
  def to_s
    print "\n\n"
    print "Username: #{@name}\n"
    print "Target: #{@target}\n"
    print "Biography: #{@bio}\n"
    print "Location: #{@place.strip}\n"
    print "--------------------------------------------------------------------------------------------------------\n"
    print "Stats:   Tweets: #{@stats[0]}       Following: #{@stats[1]}       Followers: #{@stats[2]}       Likes: #{@stats[3]}\n"
    print "--------------------------------------------------------------------------------------------------------\n"
    print "Tweets:\n"
    for i in 0..@fechas.size-1
    print "#{@fechas[i]}: #{@tweets[i]} \nRetweets: #{@rtwfav[2*i]}, Favorites: #{@rtwfav[2*i+1]}\n\n"
    end
  end
end

link = ARGV.inspect.gsub(/\[\"/,"").chop.chop
docto = open(link)

twitter = TwitterScrapper.new(docto)
twitter.extract_username
twitter.extract_target
twitter.extract_bio
twitter.extract_place
twitter.extract_stats
twitter.extract_tweets
twitter.to_s
