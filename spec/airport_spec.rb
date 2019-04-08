require 'airport'

describe Airport do

  describe '#land' do

    it 'does not allow landing in stormy weather' do
      plane = double(:plane)
      allow(subject).to receive(:rand).and_return(0)
      expect { subject.land(plane) }.to raise_error "The plane is unable to land"
    end

    it 'does not allow planes to land if the airport is full' do
      allow(subject).to receive(:stormy?).and_return(false)
      15.times { subject.land(double(:plane)) }
      expect { subject.land(double(:plane)) }.to raise_error "The airport is full"
    end

    it 'accepts different default capacities' do
      allow(subject).to receive(:stormy?).and_return(false)
      Airport::DEFAULT_CAPACITY.times { subject.land(double(:plane)) }
      expect { subject.land(double(:plane)) }.to raise_error "The airport is full"
    end
  end

  describe '#take_off' do
    it 'allows a user to instruct a plane to take off' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.take_off).to eq 'The plane has taken off'
    end

    it 'does not allow take off in stormy weather' do
      allow(subject).to receive(:rand).and_return(0)
      expect { subject.take_off }.to raise_error "Planes can't take off in stormy weather"
    end
  end
end
