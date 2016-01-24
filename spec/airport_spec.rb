require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  describe '#initialize' do

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
    let(:airport) {Airport.new(2)}

    before do
      allow(plane_1).to receive(:airborne).and_return(true)
      allow(plane_2).to receive(:airborne).and_return(true)
      allow(plane_3).to receive(:airborne).and_return(true)
      allow(plane_1).to receive(:landed)
      allow(plane_2).to receive(:landed)
      allow(plane_3).to receive(:landed)
      allow(airport).to receive(:stormy?).and_return(false)
    end

    it 'will add a plane to its array' do
      subject.land_plane(plane_1)
      expect(subject.planes).to include plane_1
    end

    it 'will not land a plane if the weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect{subject.land_plane(plane_1)}.to raise_error(RuntimeError)
    end

    it 'will not land a plane if the airport is full' do
      airport.land_plane(plane_1)
      airport.land_plane(plane_2)
      expect{airport.land_plane(plane_3)}.to raise_error(RuntimeError)
    end

    it 'will not land a grounded plane' do
      allow(plane_1).to receive(:airborne).and_return(false)
      expect{subject.land_plane(plane_1)}.to raise_error(RuntimeError)
    end

  end

  describe '#send_plane' do

    let(:plane) { double(:plane)}

    before do
      allow(subject).to receive(:stormy?).and_return false
      allow(plane).to receive(:landed)
      allow(plane).to receive(:departed)
    end

    it 'will allow a plane to take off' do
      allow(plane).to receive(:airborne).and_return true
      subject.land_plane(plane)
      subject.send_plane(plane)
      expect(subject.planes).not_to include plane
    end

    it 'is not able to send a plane that isn\'t there' do
      expect{subject.send_plane(plane)}.to raise_error(RuntimeError)
    end

    it 'will not let a plane take off if it\'s stormy' do
      allow(subject).to receive(:stormy?).and_return true
      expect{subject.send_plane(plane)}.to raise_error(RuntimeError)
    end

  end

  describe '#at_capacity?' do

    let(:airport) {Airport.new(2)}
    let(:plane_1) {double(:plane_1, :airborne => true)}
    let(:plane_2) {double(:plane_2, :airborne => true)}

    before do
      allow(airport).to receive(:stormy?).and_return false
      allow(plane_1).to receive(:landed)
      allow(plane_2).to receive(:landed)
    end

    it 'returns true if the airport is at capacity' do
      airport.land_plane(plane_1)
      airport.land_plane(plane_2)
      expect(airport.at_capacity?).to be true
    end

    it 'returns false if the airport is not at capacity' do
      airport.land_plane(plane_1)
      expect(airport.at_capacity?).to be false
    end

  end

end
