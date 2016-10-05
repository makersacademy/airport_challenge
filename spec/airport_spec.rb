require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:airport) {described_class.new}
  let(:fair_weather) {double("fair-weather", :stormy? => false)}
  subject(:fair_airport) {described_class.new(10, fair_weather)}
  let(:stormy_weather) {double("weather", :stormy? => true)}
  subject(:stormy_airport) {described_class.new(10, stormy_weather)}
  let(:plane) {Plane.new}


  describe "#land" do

    it "instructs a plane to land" do
      allow(plane).to receive(:land)
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "confirms the plane has landed" do
      fair_airport.land(plane)
      expect(fair_airport.planes).to include(plane)
    end

    context "when the weather is stormy" do
      let(:stormy_weather) {double("weather", :stormy? => true)}
       it "prevents plane from landing with exceptions" do
         expect{stormy_airport.land(plane)}.to raise_error "No landing, it's too stormy!"
       end
     end

  end

  describe "#takeoff" do

    before(:example) do
      fair_airport.land(plane)
    end

    it "instructs a plane to take off" do
      expect(airport).to respond_to(:takeoff).with(1).argument
    end

    it "confirms the plane is not in airport" do
      subject.takeoff(plane)
      expect(subject.planes).not_to include(plane)
    end
  end

  describe "capacity" do
    capacity_error = "Airport is full"

    it "doesn't accept new plane when full" do
      fair_airport.capacity.times {fair_airport.land(plane)}
      expect{fair_airport.land(plane)}.to raise_error capacity_error
    end

    it "allows default capacity to be override" do
      new_airport = Airport.new(40, fair_weather)
      40.times {new_airport.land(plane)}
      expect {new_airport.land(plane)}.to raise_error capacity_error
    end

  end

end
