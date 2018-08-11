require 'airport'

describe Airport do
  let(:plane) { Plane.new }

  describe '#land' do
    it 'lands a plane' do
      landed_plane = subject.land(plane)[-1]
      expect(landed_plane.flying).to eq false
    end
    # it 'does not allow planes to land in stormy weather' do
    #   subject.should_receive(:stormy?).and_return(true)
    #   expect {subject.land(plane)}.to raise_error 'plane cannot land in a storm'
    # end
    it 'does not allow landing if airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(plane) }.to raise_error 'no space in airport'
    end
  end

  describe '#takeoff' do
    it 'has planes flying after takeoff' do
      subject.land(plane)
      allow(subject).to receive(:stormy?) { false }
      expect(subject.takeoff(plane).flying).to eq true
    end
    it 'does not allow planes to takeoff in stormy weather' do
      subject.land(plane)
      allow(subject).to receive(:stormy?) { true }
      expect { subject.takeoff(plane) }.to raise_error 'plane cannot takeoff in a storm'
    end
  end

  describe '#at_airport?' do
    it 'says if plane is in airport' do
      subject.land(plane)
      expect(subject.at_airport?(plane)).to eq true
    end
  end

  describe '#stormy' do
    it 'can randomly generate weather conditions' do
      srand(1)
      expect(subject.stormy?).to eq true
    end
  end

end
