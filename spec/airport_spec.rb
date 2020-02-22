require 'airport'
require 'plane'
require 'weather'
shared_context "common" do
  let(:plane) { Plane.new }
end
describe Airport do
  include_context "common"
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe '#initialize' do
    it "new airport capacity defaults to 10" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "crates airport with capacity 5" do
      airport = Airport.new(5)
      expect(airport.capacity).to eq 5
    end
  end

  describe '#land' do
    it 'lands a plane' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      subject.land plane
      expect(subject.planes).to include plane
    end

    it "raises an error if airport is full" do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "No spaces are available for landing"
    end

    it 'fails when you try to land same plane' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      subject.land(plane)
      error = "This plane has already landed"
      expect { subject.land(plane) }.to raise_error error
    end

    it 'raises an error if weather is stormy' do
      error = "Cannot land the plane because weather is stormy"
      allow(subject.weather).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error error
    end
  end

  describe '#take_off' do
    it 'gets take off message' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "Plane took off"
    end

    it 'raises an error if there are no planes to take off' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      error = "There are no planes to take off"
      expect { subject.take_off(plane) }.to raise_error error
    end

    it 'raises an error if plane to take off is not there' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      error = "This plane is not currently at the airport"
      plane1 = Plane.new
      plane2 = Plane.new
      subject.land(plane1)
      expect { subject.take_off(plane2) }.to raise_error error
    end

    it 'removes plane that took off from the list' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      plane1 = Plane.new
      plane2 = Plane.new
      subject.land(plane1)
      subject.land(plane2)
      subject.take_off(plane1)
      expect(subject.planes).to eq [plane2]
    end

    it 'raises an error if weather is stormy' do
      error = "The plane cannot take off because weather is stormy"
      allow(subject.weather).to receive(:stormy?).and_return(true)
      expect { subject.take_off(plane) }.to raise_error error
    end
  end
end
