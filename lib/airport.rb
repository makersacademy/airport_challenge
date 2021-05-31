require_relative 'plane'
require_relative 'weather'

class Airport 
  attr_accessor :full, :capacity
  
  DEFAULT = 50

  def initialize(capacity = DEFAULT)
    @capacity = capacity
  end
end