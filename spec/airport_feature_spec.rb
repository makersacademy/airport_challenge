require 'airport'
require 'plane'
require 'weather'

describe "Airport_Feature_Tests" do
  it 'should allow landing and take off for multiple planes in sunny weather and not allow landing or take off during stormy weather ' do
    bom_weather = Weather.new("sunny")
    initial_bom_planes = []
    bom_capacity = rand(1..100)
    bom = Airport.new(bom_weather, initial_bom_planes, bom_capacity)

    planes = []
    (bom_capacity + 1).times { planes.push(Plane.new) }

    # No planes in the airport initially. Landing planes to fill up airport...
    bom_capacity.times { |i|
      plane = planes[i]
      bom.land(plane)
      expect(bom.planes).to include(plane)
    }
    # Airport is now full. We should not be able to land any more planes...
    last_plane = planes[bom_capacity]
    expect { bom.land(last_plane) }.to raise_error(RuntimeError, "Airport is full")

    # Now, we start take off for some planes....
    take_off_plane_count = rand(0..(bom_capacity - 1))
    take_off_plane_count.times { |i|
      plane = planes[i]
      bom.take_off(plane)
      expect(bom.planes).not_to include(plane)
    }
    # After some planes have taken off, the count for remaining planes should
    # be correctly calculated.
    expect(bom.planes.length).to eq bom_capacity - take_off_plane_count

    # Let's add a storm to the mix...
    bom_weather.condition = "stormy"
    # we know that last_plane has not landed previously.
    # We cannot say the same for any other plane with certainty
    expect { bom.land(last_plane) }.to raise_error(RuntimeError, "Plane can not land due to bad weather condition")

    # Since we had previously allowed only take_off_plane_count number of planes,
    # which could have a maximum value of bom_capacity - 1, we know that there
    # will be at least one plane available in the airport.
    # We cannot allow this plane to take off in this weather...
    one_landed_plane = bom.planes[0]
    expect { bom.take_off(one_landed_plane) }.to raise_error(RuntimeError, "Plane can not take off due to bad weather condition")

    # Let's make the weather sunny back again!!!
    bom_weather.condition = "sunny"
    # It's now time to bring last_plane HOME!!!
    bom.land(last_plane)
    expect(bom.planes).to include(last_plane)

    # Also, need to verify that take off operations have gone back to normal
    bom.take_off(one_landed_plane)
    expect(bom.planes).not_to include(one_landed_plane)
    # That's it for now!!!
  end
end
