require_relative 'plane'

class Airport

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def land(plane)
    "successful landing"
  end

  def take_off(plane)
    "sucessful take off of #{plane} from #{@name}"
  end
end