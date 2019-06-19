require_relative 'airport'

class Planes
  def initialize
    @plane = []
  end

  def land_in(airport)
    raise "Already landed." if landed?

    @plane << airport
    @plane[0]
  end

  def take_off(airport)
    raise "Plane not in airport." unless @plane.include?(airport)

    @plane.pop
  end

  private
  # def wrong?
  #   @plane.include?(airport)
  # end

  def landed?
    @plane.count == 1
  end

  # def empty?
  #   @plane.count.zero?
  # end
end
