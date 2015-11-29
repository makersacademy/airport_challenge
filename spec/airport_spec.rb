require 'airport'

describe Airport do
  subject(:airport) { described_class.new(sunny_weather) }
  let(:stormy_airport) { described_class.new(stormy_weather)}
  let(:plane) { double :plane, class: 'Plane', land!: nil, take_off!: nil }
  let(:sunny_weather) { double :weather, stormy?: false }
  let(:stormy_weather) { double :weather, stormy?: true }

  describe '#land' do
    context 'in sunny weather' do
      it 'can instruct plane to land' do
        expect(plane).to receive(:land!)
        subject.land! plane
      end

      it 'has a plane after it lands' do
        subject.land! plane
        expect(subject.contain? plane).to eq true
      end
      
      context 'when airport full' do
        it 'will not allow landing' do
          Airport::DEFAULT_CAPACITY.times { subject.land! plane }
          expect{subject.land! plane}.to raise_error 'The airport is full!'
        end
      end
    end
    
    context 'in stormy weather' do
      it 'will not allow landing' do
        expect{stormy_airport.land! plane}.to raise_error 'Too stormy!'
      end
    end
  end

  describe '#takeoff' do
    before do
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
        expect{airport.take_off! Plane.new}.to raise_error 'Plane not found!'
      end
    end

    context 'in stormy weather' do
      it 'will not allow takeoff' do
        expect{stormy_airport.take_off! plane}.to raise_error 'Too stormy!'
      end
    end
  end

  describe '#contain' do
    it 'can confirm contains plane' do
      subject.land! plane
      expect(subject.contain? plane).to eq true
    end

    it "can confirm does not contain plane" do
      expect(subject.contain? plane).to eq false
    end  
  end
end
