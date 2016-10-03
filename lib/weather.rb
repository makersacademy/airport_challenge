require_relative 'airport'
class Weather
  def initialize
    @stormy = [true, false].sample
  end
  def stormy?
    @stormy
  end
  #attr_reader :stormy
end
