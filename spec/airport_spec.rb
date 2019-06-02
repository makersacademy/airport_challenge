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
      before do
        allow(airport).to receive(:apron).with(planes).and_return(false)
        allow(airport).to receive(:stormy?).and_return(false) 
      end

      it 'has the plane after landing' do
        allow(planes).to receive(:land) { land }
        airport.land(planes) 
        expect(airport.planes).to include planes
      end

      it 'should land plane keep them' do
        expect(airport.land(planes)).to include planes
      end

      it 'should raise an error when airport is full' do
        20.times { airport.land(planes) }
        expect { airport.land(planes) }.to raise_error 'Airport is full' 
      end

      it 'does not allow plane to take off' do
        allow(airport).to receive(:apron).with(planes).and_return(false)
        allow(airport).to receive(:stormy?).and_return(true)
        expect { airport.land(planes) }.to raise_error 'Delayed due to bad weather' 
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
        expect { airport.take_off(planes) }.to raise_error 'Delayed due to bad weather'
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
        allow(subject).to receive(:stormy?).and_return(true)
      end
      it 'returns false when sunny' do
        allow(subject).to receive(:stormy?).and_return(false)
      end
    end
  end
end
