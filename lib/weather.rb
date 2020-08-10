require_relative 'airport'

class Weather

  attr_reader :storm

  def initialize
    [@storm = true, @storm = false].sample
  end

  def stormy?
    storm
  end
  
end
