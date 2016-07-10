require_relative 'airport'

class Weather

  attr_accessor :weather

  def initialize
    @weather = [:fine,:fine,:fine,:stormy][rand(4)]
  end

  def stormy?
    true if @weather == :stormy
  end




end
