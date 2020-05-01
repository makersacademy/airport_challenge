require 'plane'

RSpec.describe Plane do

  it "can create a Plane object" do
    plane = Plane.new

    expect(plane.class). to eq(Plane)
  end

  it 'can respond to #land' do
    plane = Plane.new

    expect(plane).to respond_to(:land)
  end 

  # it 'can use #land to return a plane' do
  #   plane = Plane.new

  #   expect(plane.land).to eq(plane)
  # end

  it 'can use #land to add a plane to the airport' do
    airport = Airport.new
    plane = Plane.new

    plane.land(airport)

    expect(airport.inventory.size).to eq(1)
  end

  it 'when initalized it sets the plane\'s status to "landed"' do
    plane = Plane.new

    expect(plane.status).to eq("landed")
  end

  it 'raises error if #land is attempted when airport is at capacity' do
    airport = Airport.new
    20.times{Plane.new.land(airport)}
    plane = Plane.new
    
    expect { plane.land(airport) }.to raise_error("The airport is at capacity! You cannot land!")
  end

end 