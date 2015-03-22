require 'plane'
require 'passenger_plane'
require 'passenger'

class Generator
  def initialize item, num_instances
    array = []
    num_instances.times { array.push(item.new) }
  end
end
