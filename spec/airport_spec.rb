require 'airport'

describe Airport do 

  storm_seed = (1..100).select{|n| srand(n); rand(20) == 0 }[0]
  sun_seed = storm_seed - 1
  let(:plane) { double :plane, class: Plane }

  describe '#land' do
   it 'can instruct plane to land' do
      srand(sun_seed)
      subject.land plane
      expect(subject.planes.include? plane).to eq true
    end

    it 'will not allow landing in stormy weather' do
      srand(storm_seed)
      expect{subject.land plane}.to raise_error 'The weather is too stormy!'
    end
  end

  describe '#takeoff' do  
    it 'can instruct plane to take off' do
      srand(sun_seed)
      subject.land plane
      srand(sun_seed)
      subject.takeoff plane
      expect(subject.planes.include? plane).to eq false
    end

    it 'will not allow takeoff in stormy weather' do
      srand(sun_seed)
      subject.land plane
      srand(storm_seed)
      expect{subject.takeoff plane}.to raise_error 'The weather is too stormy!'
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
    it 'can check whether weather is stormy' do
      srand(storm_seed)
      expect(subject.stormy?).to eq true
    end

    it 'can check whether weather is sunny' do
      srand(sun_seed)
      expect(subject.stormy?).to eq false
    end
  end

end
