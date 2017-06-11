require_relative "../lib/airport.rb"

class Plane

attr_reader :status

  def initialize
    @status = :flying
  end

  def landed?
    @status == :landed
  end

  def land
    @status = :landed
  end

  def fly
    @status = :flying
  end

end
