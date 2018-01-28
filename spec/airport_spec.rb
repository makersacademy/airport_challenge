require 'airport'

describe Airport do

  subject(:airport) {described_class.new(weather)}
  let(:airport_2) {described_class.new(weather, 30)}
  let(:plane) {double :plane, :status= => "Airborne"}
  let(:weather) {double :weather, stormy?: false}

  describe 'capacity' do
    it 'has a set default' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can have a specified capacity' do
      expect(airport_2.capacity).to eq 30
    end
  end

  describe '#land' do
    before(:each) do
      airport.land(plane)
    end

    it 'stores a plane that has landed' do
      expect(airport.storage).to include(plane)
    end

    it 'raises error if weather is stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect {airport.land(plane)}.to raise_error "Storm's a-brewing - Better divert course!"
    end

    it 'raises error if airport is full' do
      full_airport = Airport.new(weather, 0)
      expect {full_airport.land(plane)}.to raise_error "No room at the Inn - Try another airport!"
    end
  end

  describe '#takeoff' do

    before(:each) do |test|
      subject.land(plane) unless test.metadata[:empty]
    end

    it 'releases plane' do
      expect(subject.takeoff(plane)).to eq plane
    end

    it 'removes plane from storage' do
      subject.takeoff(plane)
      expect(subject.storage).not_to include plane
    end

    it 'raises error if weather is stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect {airport.takeoff(plane)}.to raise_error "Storm's a-brewing - Better hold tight!"
    end

    it 'raises error if airport is empty', :empty do
      expect {subject.takeoff(plane)}.to raise_error "No planes available"
    end
  end
end
