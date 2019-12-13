require 'airport'

describe Airport do
  it 'creates an instance of Airport' do
    airport = Airport.new
    expect(airport).to be_a(Airport)
  end

  describe '#takeoff' do
    it 'plane takes off' do
      airport = Airport.new
      plane = Plane.new
      airport.landing(plane)
      expect(airport.takeoff).to eq plane
    end
  end

  describe '#takeoff' do
    it 'raises error when plane is no longer in the airport' do
      airport = Airport.new
      plane = Plane.new
      expect { airport.takeoff }.to raise_error 'The plane has left the airport'
    end
  end

  it "sees planes landing" do
    plane = Plane.new
    airport = Airport.new
    expect(airport).to respond_to(:landing).with(1).argument
  end

  it "sees planes" do
    plane = Plane.new
    airport = Airport.new
    expect(airport.landing(plane)).to eq plane
  end

  it "returns landed planes" do
    plane = Plane.new
    airport = Airport.new
    airport.landing(plane)
    expect(airport.plane).to eq plane
  end

  describe '#landing' do
    it 'raises an error when the airport is full' do
      airport = Airport.new
      plane = Plane.new
      airport.landing(Plane.new)
      10.times { airport.landing Plane.new }
      expect { airport.landing Plane.new }.to raise_error 'Airport is full!'
    end
  end
end
