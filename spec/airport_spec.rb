require_relative '../lib/airport'

describe Airport do
  describe '#dock_plane' do
    it "responds to dock_plane with 1 argument" do
      plane = Plane.new("airbourne")
      planes_list = Array.new
      airport = Airport.new(planes_list,plane,6)
      expect(airport).to respond_to(:dock_plane).with(1).argument
    end

    it "responds to dock_plane with plane" do
      plane = Plane.new("airbourne")
      planes_list = Array.new
      airport = Airport.new(planes_list,plane,3)
      expect(airport.dock_plane(plane)).to eq planes_list
    end
  end

  describe '#stormy_weather' do
    # TODO - Ok, the following works, but line 28 remains uncovered in the coverage report
    # I think this is because we are "stubbing" the whole stormy_weather method
    # and therefore, it is never gatting called
    # TODO - come back to this - the following "allow" line did not work
    # allow(airport.stormy_weather?).to receive(:rand) { 0 }
    it "responds to stormy_weather with a stubbed return of false" do
      plane = Plane.new("grounded")
      planes_list = Array.new
      airport = Airport.new(planes_list,plane,2)
      allow(airport).to receive(:stormy_weather) { false }
      expect(airport.stormy_weather).to eq false
    end

    it "responds to stormy_weather with a stubbed return of true" do
      plane = Plane.new("airbourne")
      planes_list = Array.new
      airport = Airport.new(planes_list,plane,2)
      allow(airport).to receive(:stormy_weather) { true }
      expect(airport.stormy_weather).to eq true
    end

  end

  # attribute testing here
  describe 'Predicate matchers' do
    it 'this is to test plane attribute' do
      plane = Plane.new("grounded")
      planes_list = Array.new
      airport = Airport.new(planes_list,plane,11)
      expect(airport.plane).to eq plane
    end
    it 'this is to test plane attribute' do
      plane = Plane.new("grounded")
      planes_list = Array.new
      airport = Airport.new(planes_list,plane,11)
      expect(airport.capacity).to eq 11
    end
    it 'this is to test plane attribute' do
      plane = Plane.new("grounded")
      planes_list = Array.new
      airport = Airport.new(planes_list,plane)
      expect(airport.capacity).to eq 111
    end
  end

end
