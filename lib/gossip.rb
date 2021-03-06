require 'csv'
require 'pry'
class Gossip 
attr_accessor :author, :content

	def initialize(author_name,content_name)
		@author = author_name
		@content= content_name
		
	end
	
	def save
  CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [@author, @content]
  end
  end

  def self.all
  all_gossips = []
  CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
  return all_gossips
  end

  
  def self.find(id)
     return Gossip.all[id]
          
    end

  def self.update(id,author_name,update_content)
  #r+ = read then write
  CSV.open("./db/gossip.csv","r+")[id][0] << [author_name]
  CSV.open("./db/gossip.csv","r+")[id][1]  << [update_content]
 end

end

