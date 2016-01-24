require 'airport'


describe Airport do


  subject(:airport){Airport.new(Airport::DEFAULT_CAPACITY, weather)}
  let(:plane) {double(:plane)}
  let(:weather){double(:weather, :stormy? => false)}

  describe "land" do
    before (:each) do
      allow(plane).to receive(:land)
    end

    it "confirms the plane has landed" do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it "doesn't let planes land in stormy weather" do
      allow(weather).to receive(:stormy?).and_return true
      expect{airport.land(plane)}.to raise_error("Piss off, it's too stormy")
    end

    it "doesn't let planes land when the airport is full" do
      allow(airport).to receive(:full?). and_return true
      expect{airport.land(plane)}.to raise_error("Bugger off, we're full")
    end

    it "allows for a default capacity" do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe "take off" do
    before (:each) do
      allow(plane).to receive(:take_off)
    end

    it "confirms the plane has taken off" do
      airport.take_off(plane)
      expect(airport.planes).to_not include plane
    end

    it "prevents take off in stormy weather" do
      allow(weather).to receive(:stormy?).and_return true
      expect{airport.take_off(plane)}.to raise_error("Piss off, it's too stormy")
    end

  end

end


#   it 'allows a plane to land when the weather is fine' do
#     allow(weather).to receive(:stormy?)
#     airport.land(plane)
#     expect(airport.planes).to include plane
#   end
#
#   it 'confirms a landed plane is there' do
#     airport.land(plane)
#     expect(airport.planes).to include plane
#   end
#
#   it "allows a plane to take off" do
#     airport.take_off(plane)
#   end
#
#   it "confirms a departed plane has departed" do
#     airport.land(plane)
#     airport.take_off(plane)
#     expect(airport.planes).to_not include plane
#   end
#
#   it "doesn't let a plane land if stormy" do
#
#     expect {airport.land(plane)}.to raise_error ("Bad weather")
#   end
