require_relative 'plane'
require_relative 'airport'

class Weather
  attr_reader :weather

  @@conditions = [:stormy, :sunny, :sunny, :sunny]

  def initialize
    @@conditions.sample
  end

  def stormy?
    weather == :stormy
  end

end
