require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }
  
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  it 'should have a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#land' do
    context 'when not stormy' do
      before do
        allow(subject).to receive(:stormy?).and_return false
      end

      it 'land a plane at the airport' do
        expect(subject.land(plane)).to eq [plane]
      end

    context 'when full' do
      it 'it raises an error' do
        Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
        expect { subject.land(plane)}.to raise_error "Airport is full"
        end
      end
    end
  end

  context 'when stormy' do
    it 'raises an error' do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.land(plane) }.to raise_error 'Cannot land, due to stormy weather'
    end
  end

  describe '#take_off' do
    context 'when not stormy' do
      before do
        allow(subject).to receive(:stormy?).and_return false
      end

      it 'allows a plane to take off and confirms the plane has left' do
        subject.land(plane)
        expect(subject.take_off).to eq "#{plane} has taken off."
      end

      context 'when airport has no planes' do
        it 'raises an error' do
          expect { subject.take_off }.to raise_error 'There are no planes left to takeoff'
        end
      end
    end

    context 'when stormy' do
      it 'raises an error' do
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.take_off }.to raise_error 'Cannot take off, due to stormy weather'
      end
    end
  end

  
    # let(:airportstormy) { double("Stormy Airport", stormy?: true, full: false, empty?: false, ) }
    # it 'receive stormy? method' do
    #   expect(airportstormy).to receive(:stormy?) 
    #   subject.stormy?
    #   #raise_error 'Cannot land, due to stormy weather'
    # end
end
