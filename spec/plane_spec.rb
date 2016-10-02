require 'plane'

describe Plane do
  it {is_expected.to respond_to :landed? }
  it {is_expected.to respond_to :flying? }
  it {is_expected.to respond_to(:fly_to).with(1).argument }

  describe "initialization" do
    it "landed? should return nil at creation" do
      expect(subject.landed?).to be nil
    end
  end

  let(:airport) { double :airport, weather: :calm }
  let(:next_airport) { double :airport, weather: :calm }
  let(:take_off) {
    subject.send(:set_airport, airport)
    allow(airport).to receive(:take_off)
    subject.send(:take_off, next_airport)
  }

  describe "#set_airport" do
    before { subject.send(:set_airport, airport) }
    it "should set the airport where plane is landed" do
      expect(subject.airport).to eq airport
    end
    it "should set landed attribute to true" do
      expect(subject.landed?).to be true
    end
  end

  describe "#fly_to" do
    it "should raise error if it's a new plane and hasn't been landed to any airport" do
      expect { described_class.new.fly_to(airport) }.to raise_error "NEW PLANE! Assign the plane to an airport first: airport.land(plane)"
    end

    before { subject.send(:set_airport, airport) }

    it "should raise error if plane is already in that airport" do
      expect { subject.fly_to(airport) }.to raise_error "Plane is already in that airport"
    end

    it "should raise error if plane is already flying" do
      subject.send(:set_as_flying)
      expect { subject.fly_to(next_airport) }.to raise_error "Plane is already flying"
    end

    it "should raise error if the weather is stormy" do
      allow(airport).to receive(:weather).and_return(:stormy)
      expect { subject.fly_to(next_airport) }.to raise_error "Can't take off - weather is stormy!"
    end

    it "should return a landing confirmation message" do
      allow(airport).to receive(:take_off)
      expect(subject.fly_to(next_airport)).to eq "Plane has successfully landed at destination."
    end
  end

  describe "#take_off" do
    it "should set landed as false" do
      take_off
      expect(subject.landed?).to be false
    end
  end

  describe "#reset_airports" do
    before do
      subject.send(:set_airport, airport)
      subject.send(:reset_airports)
    end

    it "should set airport attribute to nil" do
      expect(subject.airport).to be nil
    end

    it "should update previous_airport attribute" do
      expect(subject.previous_airport).to be airport
    end
  end
end
