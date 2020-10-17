require "airport"

describe Airport do
  describe "#takeoff" do

    it "expects the method to exist" do
      expect(subject).to respond_to(:takeoff).with(1).argument
    end

    context "In bad weather" do
      let(:bad_weather) { double("Bad Weather", forcast: "stormy") }
      subject { described_class.new(bad_weather) }

      it "can't take off" do
        plane = Plane.new
        expect { subject.takeoff(plane) }.to raise_error "Cant take off due to stormy weather"
      end
    end

    context "In good weather" do
      let(:good_weather) { double("Good Weather", forcast: "sunny") }
      subject { described_class.new(good_weather) }

      it "will take off" do
        plane = Plane.new
        expect(subject.takeoff(plane)).to be_kind_of Plane
      end

    end
  end

  describe "#land" do
    it "expects the method to exist" do
      expect(subject).to respond_to(:land)
    end

    context "In good weather" do
      let(:good_weather) { double("Good Weather", forcast: "sunny") }
      subject { described_class.new(good_weather) }

      it "can land at this airport" do
        plane = Plane.new
        expect(subject.land(plane)).to eq plane
      end

      it "can't land a plane if it's grounded (edge case)" do
        plane = Plane.new
        plane.status = "landed"
        expect { subject.land(plane) }.to raise_error "That plane isn't in the air"
      end

      it "checks landed plane is status 'landed'" do
        plane = Plane.new
        subject.land(plane)
        expect(plane.status).to eq "landed"
      end

      it "shows plane in previously empty airport after landing" do
        plane = Plane.new
        subject.land(plane)
        expect(subject.planes).to eq [plane]
      end

      it "raises an error if trying to land at a full airport" do
        subject.capacity.times { subject.land(Plane.new) }
        expect { subject.land(Plane.new) }.to raise_error "Airport is full"
      end
    end

    context "In bad weather" do
      let(:bad_weather) { double("Bad Weather", forcast: "stormy") }
      subject { described_class.new(bad_weather) }

      it "can't land here" do
        plane = Plane.new
        expect { subject.land(plane) }.to raise_error "Cant land here due to stormy weather"
      end
    end
  end

  describe "#capacity" do
    it "checks that capacity exists" do
      expect(subject).to respond_to(:capacity)
    end

    it "checks default capacity of 2" do
      expect(subject.capacity).to eq 2
    end

    it "creates an new airport with a custom capacity of 50" do
      weather = Weather.new
      custom_airport = Airport.new(weather, 50)
      expect(custom_airport.capacity).to eq 50
    end
  end

  describe "#planes" do
    it "checks airport can respond" do
      expect(subject).to respond_to(:planes)
    end

  end
end
