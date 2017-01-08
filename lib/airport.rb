require_relative 'plane'

class Airport

    def land(plane)
      raise 'Cannot land: weather is stormy' if stormy?
    end

    def take_off(plane)
      raise 'Cannot take off: weather is stormy' if stormy?

    end

private

def stormy?
  rand(1..6) > 4
end


end
