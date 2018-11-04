require 'nokogiri'
require 'open-uri'

class Animal
  attr_accessor :name, :kingdom, :phylum, :klass, :order, :family, :genus, :species

  @@all = []

  # Hooks
  def initialize
    @@all << self
  end

  # self.all - Class Method, class Getter
  def self.all
    @@all
  end

  def self.getKingdom(doc)
    table = doc.search('.biota')
    trs = table.search('tr')
    trs[6].search('a').text
  end

  # Constructor -
  def self.new_from_wikipedia(url)
    animal = Animal.new

    #We filled in the animal's data
    doc = Nokogiri::HTML(open(url))

    animal.name = doc.search("h1#firstHeading").text
    animal.kingdom = self.getKingdom(doc)
    animal.phylum = doc.search("span.phylum").text
    animal.klass = doc.search("span.klass").text
    animal.order = doc.search("span.order").text
    animal.family = doc.search("span.family").text
    animal.genus = doc.search("span.genus").text

    animal
  end

  def self.new_from_google_search(keyword)

  end

  def self.new_from_spreadsheet(csv)

  end

end
