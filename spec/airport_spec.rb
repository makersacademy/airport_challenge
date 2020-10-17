require "airport"

describe Airport do
  describe "#takeoff" do
    weather = Weather.new
    subject { described_class.new(weather) }
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
end
