require_relative 'airport'

class Weather

  attr_reader :storm

  attr_accessor :capacity

  def initialize
    [@storm = true, @storm = false].sample
  end

  def stormy?
    storm
  end
end
