require "airport"
require "plane"

describe Airport do
  it { is_expected.to respond_to :land_plane }
  
  describe '#land_plane' do 
    it 'lands a plane upon instruction' do
      airport = Airport.new
      plane = Plane.new
      airport.take_off(plane)
      expect(airport.land_plane).to eq plane
    end

    it 'raises an error when the airport is full' do
      airport = Airport.new
      expect { airport.land_plane }.to raise_error 'The airport is full'
    end
  end

  it { is_expected.to respond_to :take_off }
  
  it 'instructs a plane to take off' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.take_off(plane)).to eq plane
  end

  it { is_expected.to respond_to :plane }

  it 'confirms the plane has taken off' do
    airport = Airport.new
    plane = Plane.new
    airport.take_off(plane)
    expect(airport.plane).to eq plane
  end

end
