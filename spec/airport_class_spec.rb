require 'plane_class'
require 'airport_class'

airport = Airport.new
plane = Plane.new

describe Airport do
  describe 'land method' do
    it 'Check if Airport class respond to the method land' do
      expect(Airport.new).to respond_to(:land)
    end
    it 'Land a plane into the airport' do
      expect(Airport.new.land(plane)[0]).to be_instance_of(Plane)
    end
  end

  describe 'take_off method.' do
    it 'Check if Airport class respond to the method take_off' do
      expect(airport).to respond_to(:take_off)
    end
  end

  describe 'take_off method' do
    before do
      airport.take_off(0)
      airport.weather = ['sunny']
    end
    it "Check if the take_off method remove a Plane instance from @hangar" do
      expect(airport.hangars).to eq []
    end
  end

  describe 'take_off method' do
    before do
      airport.weather = ['stormy']
    end
    it "Check if the take_off method raise up an Error, if weather.sample is 'stormy'." do
      expect { airport.take_off(0) }.to raise_error("The weater is stormy, the plane can't depart.")
    end
  end
end
