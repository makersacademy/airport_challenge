require 'plane'

describe Plane do

  let(:airport) { double(:airport) }

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }
    it "should add the plane to the airport planes" do
      allow(airport).to receive(:weather_conditions).and_return(:sunny)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:planes).and_return([])
      expect(subject.land(airport)).to eq([subject])
    end
    it "should not work if the weather is stormy" do
      allow(airport).to receive(:weather_conditions).and_return(:stormy)
      expect { subject.land(airport) }.to raise_error("Authorization denied due to stormy weather")
    end
    it "should not work if the airport is full" do
      allow(airport).to receive(:weather_conditions).and_return(:sunny)
      allow(airport).to receive(:full?).and_return(true)
      expect { subject.land(airport) }.to raise_error("Authorization denied due to full airport")
    end
    it "should only work for airplanes in flight" do
      subject.status = :landed
      expect { subject.land(airport) }.to raise_error("This plane is already in land")
    end
  end

  describe "#take_off" do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it "should only work for planes at that airport" do
      subject.status = :landed
      allow(airport).to receive(:planes).and_return([])
      expect { subject.take_off(airport) }.to raise_error("Plane located in different airport")
    end
    it "should not work if the weather is stormy" do
      subject.status = :landed
      allow(airport).to receive(:planes).and_return([subject])
      allow(airport).to receive(:weather_conditions).and_return(:stormy)
      expect { subject.take_off(airport) }.to raise_error("Authorization denied due to stormy weather")
    end
    it "should only work for landed planes" do
      subject.status = :in_flight
      expect { subject.take_off(airport) }.to raise_error("This plane is in flight")
    end
  end

  describe "#status" do
    it { is_expected.to respond_to(:status) }
    it "should change to 'landed' when the plane lands" do
      allow(airport).to receive(:weather_conditions).and_return(:sunny)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:planes).and_return([])
      subject.land(airport)
      expect(subject.status).to eq(:landed)
    end
    it "should change to 'in flight' when the plane takes off" do
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
