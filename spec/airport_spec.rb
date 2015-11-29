require 'airport'

describe Airport do 

  subject(:airport) { described_class.new }
  let(:plane) { double :plane, class: 'Plane', land: nil, take_off: nil }

  storm_seed = (1..100).select{|n| srand(n); rand(20) == 0 }[0]
  sun_seed = storm_seed - 1

  describe '#land' do
    context 'in sunny weather' do
      before do
        srand(sun_seed)
      end

      it 'can instruct plane to land' do
        expect(plane).to receive(:land)
        subject.land plane
      end

      it 'has a plane after it lands' do
        subject.land plane
        expect(subject.planes).to include plane
      end
      
      it 'only accepts planes for landing' do
        expect{subject.land 'not a plane'}.to raise_error 'That is not a plane!'
      end
    end
    
    context 'in stormy weather' do
      it 'will not allow landing in stormy weather' do
        srand(storm_seed)
        expect{subject.land plane}.to raise_error 'The weather is too stormy!'
      end
    end
  end

  describe '#takeoff' do
    context 'in sunny weather' do
      before do
        srand(sun_seed)
        subject.land plane
        srand(sun_seed)
      end

      it 'can instruct plane to take off' do
        expect(plane).to receive(:take_off)
        subject.take_off plane
      end

      it 'does not have plane after take off' do
        subject.take_off plane
        expect(subject.planes).to_not include plane
      end

      it 'only accepts take off for planes it contains' do
        expect{airport.take_off Plane.new}.to raise_error 'Plane not found!'
      end
    end

    context 'in stormy weather' do
      it 'will not allow takeoff in stormy weather' do
        srand(sun_seed)
        subject.land plane
        srand(storm_seed)
        expect{subject.take_off plane}.to raise_error 'The weather is too stormy!'
      end
    end
  end

  describe '#contain' do
    it 'can confirm contains plane' do
      srand(sun_seed)
      subject.land plane
      expect(subject.contain? plane).to eq true
    end

    it "can confirm does not contain plane" do
      expect(subject.contain? plane).to eq false
    end  
  end

  describe '#stormy?' do
    it 'can confirm that weather is stormy' do
      srand(storm_seed)
      expect(subject.stormy?).to eq true
    end

    it 'can confirm that weather is sunny' do
      srand(sun_seed)
      expect(subject.stormy?).to eq false
    end
  end
end
