require "airport"
require "plane"
require "weather"

describe "Integrity Test" do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  describe "Feature: Landing" do

    context "landing isn't possible when weather is stormy" do
      let(:stormy_weather) { :stormy }
      it "should raise an error when trying to land" do
        expect {
          plane.land(airport: airport, weather: stormy_weather)
        }.to raise_error "plane can't land, stormy weather"
      end
    end

    context "landing is possible when airport isn't full and weather is sunny" do

      it "should be able to land planes" do
        expect(
          plane.land(airport: airport, weather: :sunny)
        ).to be true
      end
    end

    context "landing isn't possible when airport is full" do
      
      it "should raise an error when trying to land" do
        Airport::DEFAULT_CAPACITY.times {
          plane.land(airport: airport, weather: :sunny)
        }
        expect {
          plane.land(airport: airport, weather: :sunny)
        }.to raise_error "plane can't land, airport full"
      end
    end
  end

  describe "Feature: Taking Off" do
    before do
      plane.land(airport: airport, weather: :sunny)
    end

    it "should let planes take off in sunny weather" do
      expect(
        plane.take_off(airport: airport, weather: :sunny)
      ).to be true
    end

    it "should raise error when plane tries to take off in stormy weather" do
      expect {
        plane.take_off(airport: airport, weather: :stormy)
      }.to raise_error "plane can't take off, stormy weather"
    end 

    it "should raise an error when plane is asked to take off from an airport it isn't at" do
      another_airport = Airport.new
      expect {
        plane.take_off(airport: another_airport, weather: :sunny)
      }.to raise_error "plane is not in specified airport"
    end
  end

  describe "Feature: Reporting of Plane Status" do
    before do
      plane.land(airport: airport, weather: :sunny)
    end
    
    it "A plane that's landed should report as in airport" do
      expect(airport.plane_status(plane)).to eq "plane still at airport"
    end

    it "A plane that's taken off should report as not in airport" do
      plane.take_off(airport: airport, weather: :sunny)
      expect(airport.plane_status(plane)).to eq "plane not at airport"
    end
  end

  describe "Feature: Airport capacity should be settable" do
    
    it "An airport can have its capacity specified on instantiation" do
      another_airport = Airport.new(200)
      expect(another_airport.capacity).to eq 200
    end

  end

end
