require_relative 'plane'

class Airport

attr_reader :store
attr_writer :store

  def initialize
    @store = []
  end


  def land_plane(plane)

    @store << plane
  end

  def take_off(plane)
    @store.delete(plane)
    #return @store
  end

end
