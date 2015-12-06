require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane, land!: nil, take_off!: nil }

  describe '#land' do
    context 'in sunny weather' do
      before do
        allow(subject).to receive(:stormy?).and_return false
      end

      it 'can instruct plane to land' do
        expect(plane).to receive(:land!)
        subject.land! plane
      end

      it 'has a plane after it lands' do
        subject.land! plane
        expect(subject.contain? plane).to eq true
      end
      
      context 'when airport full with defauly capcity' do
        it 'will not allow landing' do
          Airport::DEFAULT_CAPACITY.times { subject.land! plane }
          expect{subject.land! plane}.to raise_error 'The airport is full!'
        end
      end
      
      context 'when airport full with custom capacity' do
        it 'will not allow landing' do
          airport = Airport.new 3
          allow(airport).to receive(:stormy?).and_return false
          3.times { airport.land! plane }
          expect{airport.land! plane}.to raise_error 'The airport is full!'
        end
      end
    end
    
    context 'in stormy weather' do
      it 'will not allow landing' do
        allow(subject).to receive(:stormy?).and_return true
        expect{subject.land! plane}.to raise_error 'Too stormy!'
      end
    end
  end

  describe '#takeoff' do
    before do
      allow(subject).to receive(:stormy?).and_return false
      subject.land! plane
    end

    context 'in sunny weather' do
      it 'can instruct plane to take off' do
        expect(plane).to receive(:take_off!)
        subject.take_off! plane
      end

      it 'does not have plane after takeoff' do
        subject.take_off! plane
        expect(subject.contain? plane).to eq false
      end

      it 'only accepts take off for planes it contains' do
        expect{subject.take_off! Plane.new}.to raise_error 'Plane not found!'
      end
    end

    context 'in stormy weather' do
      it 'will not allow takeoff' do
        allow(subject).to receive(:stormy?).and_return true
        expect{subject.take_off! plane}.to raise_error 'Too stormy!'
      end
    end
  end

  describe '#contain' do
    it 'can confirm contains plane' do
      allow(subject).to receive(:stormy?).and_return false
      subject.land! plane
      expect(subject.contain? plane).to eq true
    end

    it "can confirm does not contain plane" do
      expect(subject.contain? plane).to eq false
    end  
  end
end
