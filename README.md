# This program is designed to control the flow of traffic at an airport.
# There are a number of conditions that affect an airplane's ability to do something:
# - When planes are instantiated, they have a status of 'flying'; once they land at an airport, this
#   status changes to 'docked.'
# - When a plane attempts to land, it checks the weather at the airport. If the weather is stormy, landing attempts
# are denied. Otherwise, landing will be successful.
# - An airport that is operating at max will not allow any more planes to land.
# - When a plane attempts to take off from an airport it is not currently station at, take-off
# permission is denied.
# - When a plane is flying, it cannot take off.
# - When a plane is flying, it's status cannot be shown as being in an airport.
# - When a plane is stationary, it cannot land.
# - When a plane is stationary, it's location must be marked as being inside an airport.
# - When a plane has taken off from an airport, it's location can no longer be associated with that airport.
# Example run:
```Ruby
  require_relative 'airport'     # => true
  airport = Airport.new          # => #<Airport:0x007fd61b958398 @planes=[], @capacity=1, @location=70278781256140>
  plane = Plane.new              # => #<Plane:0x007fd61b9581b8 @status=:flying>
  plane.land(airport)            # => :docked
  airport                        # => #<Airport:0x007fd61b958398 @planes=[#<Plane:0x007fd61b9581b8 @status=:docked, @location=70278781256140>], @capacity=1, @location=70278781256140>
  plane.take_off(airport)        # => #<Plane:0x007fd61b9581b8 @status=:flying, @location="">
  airport                        # => #<Airport:0x007fd61b958398 @planes=[], @capacity=1, @location=70278781256140>
    begin
  plane.take_off(airport)
    rescue RuntimeError => e
      e                          # => #<RuntimeError: You are already flying>
    end                          # => #<RuntimeError: You are already flying>
  another_airport = Airport.new  # => #<Airport:0x007fd61b953780 @planes=[], @capacity=1, @location=70278781246400>
  plane.land(another_airport)    # => :docked
    begin
  plane.take_off(airport)
    rescue RuntimeError => e
      e                          # => #<RuntimeError: You cannot take off from that airport>
    end                          # => #<RuntimeError: You cannot take off from that airport>
```
