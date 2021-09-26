require "plane"
require "pry"

describe Plane do
  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it "report a plane as 'in airport', after landing" do
      airport = Airport.new
      subject.land(airport)
      expect(subject).to be_in_airport(airport)
    end

    it "doesn't let a plane land, when the airport is full" do
      airport = Airport.new
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error "Airport is full"
    end
  end

  describe "#takeoff" do
    let(:stormy) { false }

    subject do
      stormy_weather = instance_double("Weather", :stormy? => stormy)
      Weather.stub(:new) { stormy_weather }
      described_class.new
    end

    it { is_expected.to respond_to(:takeoff) }

    context "when stormy" do
      let(:stormy) { true }

      it "raises an error" do
        airport = Airport.new
        subject.land(airport)
        expect { subject.takeoff }.to raise_error "Weather is stormy"
      end
    end

    it "report a plane as 'not in airport', after takeoff" do
      airport = Airport.new
      subject.land(airport)
      subject.takeoff
      expect(subject).not_to be_in_airport(airport)
    end
  end

  it { is_expected.to respond_to(:in_airport?) }
end
