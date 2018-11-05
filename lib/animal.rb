require 'nokogiri'
require 'open-uri'
require 'pry'

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

  def self.getPhylum(doc)
    table = doc.search('.biota')
    trs = table.search('tr')
    trs[7].search('a').text
    # binding.pry
  end

  def self.getKlass(doc)
    table = doc.search('.biota')
    trs = table.search('tr')
    trs[9].search('a').text
    # binding.pry
  end

  def self.getOrder(doc)
    table = doc.search('.biota')
    trs = table.search('tr')
    trs[10].search('a').text
    # binding.pry
  end

  def self.getFamily(doc)
    table = doc.search('.biota')
    trs = table.search('tr')
    trs[11].search('a').text
    # binding.pry
  end

  def self.getGenus(doc)
    table = doc.search('.biota')
    trs = table.search('tr')
    trs[12].search('a').text
    # binding.pry
  end

  # Constructor -
  def self.new_from_wikipedia(url)
    animal = Animal.new

    #We filled in the animal's data
    doc = Nokogiri::HTML(open(url))

    animal.name = doc.search("h1#firstHeading").text
    animal.kingdom = self.getKingdom(doc)
    animal.phylum = self.getPhylum(doc)
    animal.klass = self.getKlass(doc)
    animal.order = self.getOrder(doc)
    animal.family = self.getFamily(doc)
    animal.genus = self.getGenus(doc)

    animal
    # binding.pry
  end

  def self.new_from_google_search(keyword)

  end

  def self.new_from_spreadsheet(csv)

  end

end
