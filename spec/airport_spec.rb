require 'airport'
require 'plane'

describe Airport do
  #do not create instances here as these will be available everywhere
  #and will be valid for all the unit tests, best to have only
  #what you need
  
  describe "#land" do
    it "allows the plane to land" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to be_truthy
    end
  end

  describe "#take_off" do
    it "allows the plane to take off" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off(plane)).to be_truthy
    end

    it "confirms the plane is not at the airport anymore" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.is_in_hangar?(plane)).to be_truthy
      airport.take_off(plane)
      expect(airport.is_in_hangar?(plane)).to be_falsey
    end
  end

  it 'has a variable capacity' do
    airport = Airport.new(50)
    50.times {airport.land(Plane.new)}
    expect(airport.hangar.count).to eq(50)
  end

  it 'can prevent planes landing if the airport capacity is full' do
    airport = Airport.new(25)
    25.times { airport.land Plane.new }
    expect { airport.land Plane.new }.to raise_error "Airport full"
  end

  it 'has a default capacity' do
    airport = Airport.new 
    expect(airport.capacity).to eq(25)
  end
end