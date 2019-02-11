require 'airport'
require 'plane'

describe Airport do
  before :each do
    @airport = Airport.new(20)
  end
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    context 'when full' do
      it 'raises an error' do
        plane = :plane
        allow(@airport).to receive(:stormy?).and_return false
        20.times do
          @airport.land(plane)
        end
        expect { @airport.land(plane) }.to raise_error 'When full'
      end
    end

    it 'doesnt allow to land when stormy' do
      plane = Plane.new
      allow(@airport).to receive(:stormy?).and_return true
      expect { @airport.land(plane) }.to raise_error 'Cannot land, its stormy!'
    end
  end

  describe '#take_off' do
    it 'plane takes off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end
    it 'doesnt allow to take off when stormy' do
      plane = Plane.new
      allow(@airport).to receive(:stormy?).and_return true
      expect { @airport.take_off(plane) }.to raise_error 'Cannot take off, its stormy!'
  end
end
