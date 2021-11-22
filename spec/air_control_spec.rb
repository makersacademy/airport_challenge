require 'airport'
require 'plane'
require 'air_control.rb'

describe AirportControl do
  
  describe '#stormy?' do
    it 'Allows pilots and air control staff to check the weather' do
      plane = Plane.new("Boeing", "Paris", "London", "Flying")
      expect(plane.stormy?).to eq(true).or eq(false)
     end
  end

  describe '#request_landing' do
    it 'Allows planes to request permission to land' do
      allow_any_instance_of(AirportControl).to receive(:stormy?).and_return(false)
      plane = Plane.new("Boeing", "Paris", "London", "Flying")
      expect(plane.request_landing(plane)).to be_an_instance_of Array
    end
  end

  describe '#take_off' do
    it 'Lands the plane' do
      allow_any_instance_of(AirportControl).to receive(:stormy?).and_return(false)
      plane = Plane.new("Boeing", "Paris", "London", "Departing")
      expect(plane.take_off(plane)).to be_an_instance_of Array
    end
  end

end
