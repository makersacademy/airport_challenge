require 'plane'
require 'airport'

describe Plane do
    
  it {is_expected.to respond_to(:land).with(1)}
  it {is_expected.to respond_to(:takeoff).with(1)}
   
  describe'#land' do
    it 'will instruct a plane to land at an airport' do
      air_port = Airport.new
      subject.land(air_port)
      expect(air_port.landed_plane).to eq(subject)
    end 
    it 'will not land if the airport is full' do
      air_port = Airport.new
      plane2 = Plane.new
      plane2.land(air_port)
      expect{subject.land(air_port)}.to raise_error 'airport is full'
      expect(air_port.landed_plane).to eq(plane2)
    end 
  end 
  describe'#takeoff' do 
    it ' will instruct a plane to takeoff from an airport' do
      air_port = Airport.new 
      subject.land(air_port)
      expect(air_port.landed_plane).to eq(subject)
      subject.takeoff(air_port)
      expect(air_port.landed_plane).to eq(nil)
    end
  end
end

    