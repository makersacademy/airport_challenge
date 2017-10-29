require 'plane'

describe Plane do

  let(:airport) { double(:airport) }

  describe "#land" do
    it "should land at an airport" do
      expect(subject).to respond_to(:land).with(1).argument
      allow(airport).to receive(:weather_conditions).and_return(:sunny)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:planes).and_return([])
      expect(subject.land(airport)).to eq([subject])
    end
    it "should not land if the weather is 'stormy'" do
      allow(airport).to receive(:weather_conditions).and_return(:stormy)
      expect { subject.land(airport) }.to raise_error("Authorization denied due to stormy weather")
    end
    it "should not land if the airport is full" do
      allow(airport).to receive(:weather_conditions).and_return(:sunny)
      allow(airport).to receive(:full?).and_return(true)
      expect { subject.land(airport) }.to raise_error("Authorization denied due to full airport")
    end
    it "should only land if it's in flight" do
      subject.status = :landed
      expect { subject.land(airport) }.to raise_error("This plane is already in land")
    end
  end

  describe "#take_off" do
    it "should take off from an airport" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it "should only take off from the airport it is in" do
      subject.status = :landed
      allow(airport).to receive(:planes).and_return(Array.new)
      expect { subject.take_off(airport) }.to raise_error("Plane located in different airport")
    end
    it "should not take_off if the weather is 'stormy'" do
      subject.status = :landed
      allow(airport).to receive(:planes).and_return([subject])
      allow(airport).to receive(:weather_conditions).and_return(:stormy)
      expect { subject.take_off(airport) }.to raise_error("Authorization denied due to stormy weather")
    end
    it "should only take off if it's landed" do
      subject.status = :in_flight
      expect { subject.take_off(airport) }.to raise_error("This plane is in flight")
    end
  end

  describe "#status" do
    it "should change its status to 'landed'" do
      expect(subject).to respond_to(:status)
      # allow(airport).to receive(:dock)
      allow(airport).to receive(:weather_conditions).and_return(:sunny)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:planes).and_return([])
      subject.land(airport)
      expect(subject.status).to eq(:landed)
    end
    it "should change its status to 'in flight'" do
      subject.status = :landed
      allow(airport).to receive(:planes).and_return([subject])
      allow(airport).to receive(:confirm_take_off)
      allow(airport).to receive(:weather_conditions).and_return(:sunny)
      subject.take_off(airport)
      expect(subject.status).to eq(:in_flight)
    end
  end

  describe "#confirm_take_off" do
    it { is_expected.to respond_to(:confirm_take_off).with(1).argument }
    it "leaves the airport database" do
      allow(airport).to receive(:planes).and_return([subject])
      expect(subject.confirm_take_off(airport)).to eq(subject)
    end
  end

  describe "#in?" do
    it "should check if its in the required airport" do
      expect(subject).to respond_to(:in?).with(1).argument
      allow(airport).to receive(:planes).and_return([])
      expect(subject.in?(airport)).to eq nil
    end
  end
end
