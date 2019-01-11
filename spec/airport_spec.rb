require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  let(:plane) { double :plane }
  let(:plane2) { double :plane }

  describe '#land' do

    it 'Should see plane in airport' do
      allow(subject).to receive(:weather).and_return(false)
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it 'should see multiple planes in airport' do
      allow(subject).to receive(:weather).and_return(false)
      subject.land(plane)
      subject.land(plane2)
      expect(subject.planes).to include(plane, plane2)
    end

    it 'should not allow a plane to land if weather is stormy' do
      allow(subject).to receive(:weather).and_return(true)
      expect { subject.land(plane) }.to raise_error("Unable to land due to stormy weather")
    end

    it 'should not allow a plane to land if the airport is full' do
      allow(subject).to receive(:weather).and_return(false)
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error("Unable to land due airpot capacity being full")
    end

  end

  describe '#take_off' do

    it 'should remove plane from airport' do
      allow(subject).to receive(:weather).and_return(false)
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to be_empty
    end

    it 'should allow only remove plane that took off from airport' do
      allow(subject).to receive(:weather).and_return(false)
      subject.land(plane)
      subject.land(plane2)
      subject.take_off(plane)
      expect(subject.planes).to include(plane2)
      expect(subject.planes).not_to include(plane)
    end

    it 'should not allow a plane to take off if weather is stormy' do
      allow(subject).to receive(:weather).and_return(false)
      subject.land(plane)
      allow(subject).to receive(:weather).and_return(true)
      expect { subject.take_off(plane) }.to raise_error("Unable to take off due to stormy weather")
    end

  end

end
