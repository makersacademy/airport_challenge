require 'airport'

RSpec.describe Airport do

  subject(:airport) { described_class.new }
  let(:planes) { double :plane }

  describe '#initialize' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      allow(subject).to receive(:full?) { true }
    end

    it 'user can set the capacity' do
      subject { Airport.new(20) }
      expect(subject.capacity).to eq(20)
    end

    describe '#planes' do
      it 'should return planes in array' do
        expect(subject.planes).to eq(Array.new)
      end
    end
  end 

  context 'landing' do
    it { is_expected.to respond_to(:land).with(1).argument }
    
    describe '#land' do 
      it 'should be able to land plane' do
        allow(airport).to receive(:apron).with(planes).and_return(false)
        allow(airport).to receive(:stormy?).and_return(false)
        expect(airport.land(planes)).to eq([planes])
      end

      it 'should raise and error when there is a stormy weather' do
        allow(airport).to receive(:apron).with(planes).and_return(false)
        allow(airport).to receive(:stormy?).and_return(true)
        expect { airport.land(planes) }.to raise_error 'Weather is stormy, landing is not permitted' 
      end

      it 'should raise an error when airport is full' do
        allow(airport).to receive(:apron).with(planes).and_return(false)
        allow(airport).to receive(:stormy?).and_return(false)
        20.times { airport.land(planes) }
        expect { airport.land(planes) }.to raise_error 'Airport is full' 
      end

      it 'raises an error if plane tries to land again' do
        allow(airport).to receive(:apron).with(planes).and_return(true)
        allow(airport).to receive(:stormy?).and_return(false)
        expect { airport.land(planes) }.to raise_error 'Plane has already landed'
      end
    end
  end

  context 'take off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    
    describe '#take_off' do
      it 'raises and error if the weather is stormy' do
        allow(airport).to receive(:apron).with(planes).and_return(true)
        allow(airport).to receive(:stormy?).and_return(true)
        expect { airport.take_off(planes) }.to raise_error 'Weather is stormy, take-off is not permitted'
      end

      it 'raises an error if plane not in airport' do
        allow(airport).to receive(:apron).with(planes).and_return(false)
        allow(airport).to receive(:stormy?).and_return(false)
        expect { airport.take_off(planes) }.to raise_error 'Plane is not in this airport'
      end
    end
  end

  context 'stormy' do 
    describe '#stormy?' do
      it 'returns true when stormy' do
        allow(subject).to receive(:stormy).and_return true
      end
      it 'returns true when stormy' do
        allow(subject).to receive(:stormy).and_return true
      end
    end
  end
end
