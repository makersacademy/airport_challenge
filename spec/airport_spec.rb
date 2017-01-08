require 'airport'

describe Airport do

  it {is_expected.to respond_to(:landing_bay)}

  it "initializes with a landing bay that is an array" do
    expect(subject.landing_bay).to be_a Array
  end

  it "should initialize with a landing bay that is empty" do
    expect(subject.landing_bay).to be_empty
  end

  it { is_expected.to respond_to(:land_plane).with(1).argument }

  describe "#land_plane" do

    context "good weather attempted landing" do

        it "should park a plane in the empty landing bay and that plane should have a landed status" do
          #first ensure the weather is good by setting STORM_PROBABILITY TO 0
          stub_const("Weather::STORM_PROBABILITY", 0)
          plane = Plane.new
          airport = Airport.new
          landing_bay = airport.land_plane(plane)
          expect(landing_bay.count).to eq 1
          expect(landing_bay[0].landed_status).to eq "Landed"
        end

        it "should park many planes in the airport's landing bay" do
          #first ensure the weather is good by setting STORM_PROBABILITY TO 0
          stub_const("Weather::STORM_PROBABILITY", 0)
          airport = Airport.new
          #land planes at the one airport
          expect(Airport::DEFAULT_CAPACITY.times {airport.land_plane(Plane.new)}).to eq Airport::DEFAULT_CAPACITY
        end
    end

    context "stormy weather attempted landing" do

      it "should prevent landing in stormy weather" do
        #first ensure the weather is stormy by setting STORM_PROBABILITY TO 1
        stub_const("Weather::STORM_PROBABILITY", 1)
        plane = Plane.new
        airport = Airport.new
        expect {airport.land_plane(plane)}.to raise_error "Stormy Weather Alert: Landing not permitted"
      end

    end

    context "landing in a full airport" do

      it "should prevent landing when the airport is full" do
        airport = Airport.new
        #first ensure planes can both land and take-off for testing purposes so set STORM_PROBABILITY TO 0
        stub_const("Weather::STORM_PROBABILITY", 0)
        #now fill the aiport landing bay to capacity
        Airport::DEFAULT_CAPACITY.times {airport.land_plane(Plane.new)}
        #then try and land one more plane
        expect {airport.land_plane(Plane.new)}.to raise_error "Airport Full Alert: Landing not permitted"
      end
    end
  end

  it { is_expected.to respond_to(:take_off) }

  describe "#take_off" do
    context "good weather attempted take-off" do

      it "should allow a plane to take off" do
        #first ensure the weather is good by setting STORM_PROBABILITY TO 0
        stub_const("Weather::STORM_PROBABILITY", 0)
        airport = Airport.new
        #land planes at the one airport
        Airport::DEFAULT_CAPACITY.times {airport.land_plane(Plane.new)}
        #note: planes will take_off on a FIFO time-basis (to be checked with client)
        expect(airport.take_off).to eq "Airbourne"
      end
    end

    context "stormy weather attempted take-off" do

      it "should prevent take off in stormy weather" do

        airport = Airport.new
        #land planes at the one airport
        #first ensure planes can land so set STORM_PROBABILITY TO 0
        stub_const("Weather::STORM_PROBABILITY", 0)
        Airport::DEFAULT_CAPACITY.times {airport.land_plane(Plane.new)}
        #now ensure the weather is stormy for take-off by setting STORM_PROBABILITY TO 1
        stub_const("Weather::STORM_PROBABILITY", 1)
        expect {airport.take_off}.to raise_error "Stormy Weather Alert: Take-off not permitted"
      end
    end
  end
end
