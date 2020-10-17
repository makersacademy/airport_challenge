require "airport"

describe Airport do
  describe "#takeoff" do

    it "expects the method to exist" do
      expect(subject).to respond_to(:takeoff)
    end

    context "In bad weather" do
      let(:bad_weather) { double("Bad Weather", forcast: "stormy") }
      subject { described_class.new(bad_weather) }

      it "won't take off if weather is bad" do
        expect { subject.takeoff }.to raise_error "Cant take off due to stormy weather"
      end
    end

    context "In good weather" do
      let(:good_weather) { double("Good Weather", forcast: "sunny") }
      subject { described_class.new(good_weather) }

      it "will take off if weather is fine" do
        expect(subject.takeoff).to be_kind_of Plane
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
end
