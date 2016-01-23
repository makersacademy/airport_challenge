require 'airport'

describe Airport do

  let(:plane) {double(:plane)}
  let(:plane2) {double(:plane)}
  #let(:storm_weather) {double(:weather, stormy?: true)}
  #let(:calm_weather) {double(:weather, stormy?: false)}

  describe '#initialize' do

    it 'initializes with a default capacity' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it 'initializes with variable capacity' do
      pending('variable capacity')
      airport = Airport.new 49
      expect (airport.capacity).to eq 49
    end
  end

  context 'landing a plane' do
    before (:each) do
      allow(plane).to receive(:to_land)
      allow(subject).to receive(:stormy?) { false }
    end

    it 'instructs plane to land' do
      expect(plane).to respond_to(:to_land)
      subject.land(plane)
    end

    it 'lands a plane' do
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it 'confirms that plane is at airport' do
      subject.land(plane)
      expect(subject.contains?(plane)).to eq true
    end

    it 'will only land if it is in the air' do
      pending('edge case')
      edgecase
    end

    it 'plane is prevented from landing in stormy weather' do
      allow(subject).to receive(:stormy?) { true }
      expect{subject.land(plane)}.to raise_error('Landing is not allowed in stormy weather')
    end

  end

  context 'take-off' do
    before (:each) do
      allow(plane).to receive(:to_land)
      allow(plane).to receive(:take_off)
      subject.land(plane)
      allow(subject).to receive(:stormy?) { false }
    end

    it 'instructs plane to take_off' do
      expect(plane).to respond_to(:take_off)
    end

    it 'plane not at airport' do
      subject.take_off(plane)
      expect(subject.planes).not_to include plane
    end

    it 'a specific plane takes-off' do
      allow(plane2).to receive(:to_land)
      subject.land(plane2)
      subject.take_off(plane)
      expect(subject.planes).not_to include plane
    end

    it 'confirmed that specific plane is not at airport' do
      allow(plane2).to receive(:to_land)
      subject.land(plane2)
      subject.take_off(plane)
      expect(subject.contains?(plane)).to eq false
    end

    it 'plane is prevented from taking off in stormy weather' do
      allow(subject).to receive(:stormy?) { true }
      expect{subject.take_off(plane)}.to raise_error('Take-off is not allowed in stormy weather')
    end

  end



end

=begin

it 'instructs plane to land' do
  allow(plane).to receive(:to_land)
  expect(plane).to respond_to(:to_land)
  subject.instruct_land(plane)
end
=end
