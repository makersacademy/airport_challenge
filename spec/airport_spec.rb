require 'airport'

describe Airport do

  describe '#initialize' do

    it {is_expected.to respond_to :planes}
    it {is_expected.to respond_to :capacity}

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'has a default capacity that can be changed' do
      expect(Airport.new(6).capacity).to eq 6
    end

  end

  describe '#land_plane' do

    let(:plane_1) { double(:plane_1)}
    let(:plane_2) { double(:plane_2)}
    let(:plane_3) { double(:plane_3)}

    it {is_expected.to respond_to :land_plane}

    it 'will add a plane to its array' do
      allow(plane_1).to receive(:landed)
      allow(plane_1).to receive(:airborne).and_return(true)
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land_plane(plane_1)
      expect(subject.planes).to include plane_1
    end

    it 'will not land a plane if the weather is stormy' do
      allow(plane_1).to receive(:landed)
      allow(plane_1).to receive(:airborne)
      allow(subject).to receive(:stormy?).and_return(true)
      expect{subject.land_plane(plane_1)}.to raise_error(RuntimeError)
    end

    it 'will not land a plane if the airport is full' do
      allow(plane_1).to receive(:airborne).and_return(true)
      allow(plane_2).to receive(:airborne).and_return(true)
      allow(plane_1).to receive(:landed)
      allow(plane_2).to receive(:landed)
      airport = Airport.new(1)
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land_plane(plane_1)
      expect{airport.land_plane(plane_2)}.to raise_error(RuntimeError)
    end

    it 'will not land a grounded plane' do
      allow(plane_1).to receive(:airborne).and_return(false)
      allow(plane_1).to receive(:landed)
      airport = Airport.new(2)
      expect{airport.land_plane(plane_1)}.to raise_error(RuntimeError)
    end

  end

  describe '#send_plane' do

    let(:plane) { double(:plane)}

    it {is_expected.to respond_to :send_plane}

    it 'will allow a plane to take off' do
      allow(plane).to receive(:landed)
      allow(plane).to receive(:departed)
      allow(plane).to receive(:airborne).and_return true
      allow(subject).to receive(:stormy?).and_return false
      subject.land_plane(plane)
      subject.send_plane(plane)
      expect(subject.planes).not_to include plane
    end

    it 'is not able to send a plane that isn\'t there' do
      allow(plane).to receive(:departed)
      allow(plane).to receive(:airborne)
      allow(subject).to receive(:stormy?).and_return false
      expect{subject.send_plane(plane)}.to raise_error(RuntimeError)
    end

    it 'will not let a plane take off if it\'s stormy' do
      allow(plane).to receive(:departed)
      allow(subject).to receive(:stormy?).and_return(true)
      expect{subject.send_plane(plane)}.to raise_error(RuntimeError)
    end

  end

  describe '#at_capacity?' do

    let(:plane) { double(:plane, :airborne => true)}

    it {is_expected.to respond_to :at_capacity?}

    it 'returns true if the airport is at capacity' do
      airport = Airport.new(2)
      p1 = double(:plane, :airborne => false)
      p2 = double(:plane, :airborne => false)
      airport.planes << p1
      airport.planes << p2
      expect(airport.at_capacity?).to be true
    end

    it 'returns false if the airport is not at capacity' do
      airport = Airport.new(2)
      p1 = double(:plane, :airborne => false)
      airport.planes << p1
      expect(airport.at_capacity?).to be false
    end

  end

  describe 'stormy?' do

    it {is_expected.to respond_to :stormy?}

    it 'returns false if the weather is not stormy' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.stormy?).to be false
    end

    it 'returns true if the weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect(subject.stormy?).to be true
    end

  end

end
