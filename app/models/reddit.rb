require 'open-uri'
class Reddit
  def self.rss(url)
    data = open "http://reddit.com/r/#{url}.rss"
    doc = Nokogiri::XML(data)
    doc.css("item").each do |i|
      link = Nokogiri::HTML(i.css("description").children.first.content).css("a").to_a.second.attributes["href"].value
      
      i.css("link").children.first.content = link
    end
    doc.css("link")
    doc.to_s  
  end
end