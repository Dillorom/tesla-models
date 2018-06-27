require 'pry'
class TeslaModels::Model

  attr_accessor :name, :availability, :price, :url, :acceleration_speed, :horsepower, :top_speed

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

end
