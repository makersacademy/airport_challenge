require './lib/airport.rb'

describe Airport do
  subject(:airport) { described_class.new(25) }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  context "A plane can land" do
    it '#lands an argument when an argument is passed' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it '#finds the plane that has been landed' do
      expect(subject.land(plane)).to eq subject.planes
    end
  end

  context "A plane can take off" do
    it "#a plane is received on take off" do
      allow(subject).to receive(:storm_outside?).and_return false
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end
    it "#unable to let a plane that doesn't exist take off" do
      expect { subject.take_off(plane) }.to raise_error "No planes available"
    end
    it "#confirm that the plane is no longer at the airport" do
      allow(subject).to receive(:storm_outside?).and_return false
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to be_empty
    end
  end

  context "Prevent takeoff" do
    it "#prevent take off when weather is stormy" do
      allow(weather).to receive(:storm_outside?).and_return true
      subject.land(plane)
      expect { subject.take_off(plane) }.to raise_error(RuntimeError)
    end
  end

  context "Prevent landing when the airport is full" do
    it "#tests if the airport is full" do
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "The airport is full"
    end
  end

  context "Capacity exists and can be overwritten" do
    it "#capacity respnds to a value" do
      subject = Airport.new(20)
      expect(subject.capacity).to eq 20
    end
    it "#can store a new capacity value at initialisation" do
      subject = Airport.new(50)
      expect(subject.capacity).to eq 50
    end
    it "#can access a default constant for capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

end
