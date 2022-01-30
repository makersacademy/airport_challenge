require_relative '../lib/airport'

describe Airport do
  describe 'capacity?' do
    it "responds to capacity" do
      plane = Plane.new("grounded")
      airport = Airport.new(plane)
      expect(airport.capacity?).to be_nil
    end  
  end

  describe '#release_plane' do
    it "responds to release_plane with a plane" do
      plane = Plane.new("grounded")
      airport = Airport.new(plane)
      expect(airport.release_plane).to be_instance_of Plane
    end  
  end

  describe '#dock_plane' do
    it "responds to dock_plane with 1 argument" do
      plane = Plane.new("airbourne")
      airport = Airport.new(plane)
      expect(airport).to respond_to(:dock_plane).with(1).argument
    end

    it "responds to dock_plane with plane" do
      plane = Plane.new("airbourne")
      airport = Airport.new(plane)
      expect(airport.dock_plane(plane)).to eq plane
    end
  end

  describe '#stormy_weather' do
    # TODO - I cannot quite work out how to stub or mock a response
    # it "responds to stormy weather with 'rand' override" do
    #  plane = Plane.new
    # airport = Airport.new(plane)
      # rand = double("rand")
      # allow(rand).to receive(:2).and_return(:1)
    #  stormy_weather = double("stormy_weather")
    #  allow(stormy_weather).to eq false
    #  expect(airport.stormy_weather).to eq false
    # end

    # Ok, the following works, but line 28 remains uncovered in the coverage report
    # I think this is because we are "stubbing" the whole stormy_weather method
    # and therefore, it is never gatting called
    # TODO - come back to this
    it "responds to stormy_weather with a stubbed return of false" do
      plane = Plane.new("grounded")
      airport = Airport.new(plane)
      allow(airport).to receive(:stormy_weather) { false }
      expect(airport.stormy_weather).to eq false
    end

    it "responds to stormy_weather with a stubbed return of true" do
      plane = Plane.new("airbourne")
      airport = Airport.new(plane)
      allow(airport).to receive(:stormy_weather) { true }
      expect(airport.stormy_weather).to eq true
    end

  end

  # attribute testing here
  describe 'Predicate matchers' do
    it 'this is to test plane attribute' do
      plane = Plane.new("grounded")
      airport = Airport.new(plane)
      expect(airport.plane).to eq plane
    end
  end

end
