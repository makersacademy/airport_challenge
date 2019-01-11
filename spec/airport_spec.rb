require 'airport'
require 'plane'

describe Airport do
  before do
    allow(subject).to receive(:weather).and_return(false)
  end

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  let(:plane) { double :plane }
  let(:plane2) { double :plane }

  describe '#land' do

    it 'Should see plane in airport' do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it 'should see multiple planes in airport' do
      subject.land(plane)
      subject.land(plane2)
      expect(subject.planes).to include(plane, plane2)
    end

  end

  describe '#take_off' do

    it 'should remove plane from airport' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to be_empty
    end

    it 'should allow only remove plane that took off from airport' do
      subject.land(plane)
      subject.land(plane2)
      subject.take_off(plane)
      expect(subject.planes).to include(plane2)
      expect(subject.planes).not_to include(plane)
    end

  end

  describe '#capacity' do

    it 'should not allow a plane to land if the airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error("Unable to land due airpot capacity being full")
    end

    it 'should allow the airport capacity to be changed' do
      airport = Airport.new(5)
      allow(airport).to receive(:weather).and_return(false)
      5.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error("Unable to land due airpot capacity being full")
    end

    it 'should allow the capacity to be changed at any time' do
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      subject.capacity = 11
      subject.land(plane)
      expect(subject.planes.length).to eq 11
    end
  end

  describe '#weather' do

    it 'should not allow a plane to land if weather is stormy' do
      allow(subject).to receive(:weather).and_return(true)
      expect { subject.land(plane) }.to raise_error("Unable to land due to stormy weather")
    end

    it 'should not allow a plane to take off if weather is stormy' do
      allow(subject).to receive(:weather).and_return(false)
      subject.land(plane)
      allow(subject).to receive(:weather).and_return(true)
      expect { subject.take_off(plane) }.to raise_error("Unable to take off due to stormy weather")
    end

  end

end
