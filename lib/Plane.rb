require 'TrafficController'
require 'Airport'

class Plane
  @@next_id = 1
  attr_reader :ID

  def initialize
    @ID = @@next_id
    @@next_id += 1
  end

end