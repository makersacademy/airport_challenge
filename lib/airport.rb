require_relative 'weather'

class Airport
  attr_accessor :planes, :stormy

  def initialize
    @planes = []
    @stromy = stormy
  end

  include Weather

  def land(plane)
  raise 'Landing not allowed due to the poor weather conditions' if @stormy
  end

  def take_off(plane)
  raise 'Take off not allowed due to the poor weather conditions' if @stormy
  end

  def empty_error
    raise "No planes available" if empty?
  end

  private

  
  def empty?
    @planes.empty?
  end


end
