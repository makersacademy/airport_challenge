require_relative "airport.rb"

class Plane
  attr_accessor :has_landed
  def initialize(has_landed = false)
    @has_landed = has_landed
  end

end
