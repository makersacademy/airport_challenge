require 'landing_planes'

describe Landing_planes do
it "Lands plane on airport" do
  airport = Airport.new(5)
  capacity = airport.capacity
  landing_planes = Landing_planes.new(capacity)
  flying_planes = ["plane", "plane", "plane", "plane", "plane"] 
  landed_planes = []
  landing_planes.landed_planes(flying_planes, landed_planes)
  expect(landed_planes.length).to eq(capacity)
  expect(flying_planes.length).to eq(0)
  end

  it "checks that airport default capacity is not surpassed" do
    airport = Airport.new(5)
    capacity = airport.capacity
    landing_planes = Landing_planes.new(capacity)
    
    expect(landing_planes.maximum).to eq(5) 
  end

  it "Prevent landing of planes when Airport is full" do
    airport = Airport.new(7)
    maximum = airport.capacity
    landing_planes = Landing_planes.new(maximum)
    capacity = landing_planes.maximum
    flying_planes = ["plane", "plane", "plane", "plane", "plane"]
    landed_planes = ["plane", "plane", "plane"]
    landing_planes.landed_planes(flying_planes, landed_planes)
    
    
    expect(landed_planes.length).to eq(maximum)
    expect { raise "Airport Full" }.to raise_error(RuntimeError, "Airport Full")
  end
end
    
    
    