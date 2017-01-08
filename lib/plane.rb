require_relative 'weather'

class Plane

attr_reader :stormy

  def initialize(stormy = Weather.new.stormy)
    @stormy = stormy
  end

  def land
  @stormy
  end

  def depart
  @stormy
  end

end
