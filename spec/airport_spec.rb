require 'airport'

describe Airport do

  subject(:airport) {described_class.new(weather)}
  let(:airport_2) {described_class.new(weather, 30)}
  let(:plane) {double :plane, :status= => nil}
  let(:weather) {double stormy?: false}

  describe 'storage' do
    it 'is empty when instantiated' do
      expect(subject.storage).to eq []
    end
  end

  describe 'capacity' do
    it 'has a set default' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can have a specified capacity' do
      expect(airport_2.capacity).to eq 30
    end
  end

  describe '#land' do
    before(:each) do
      subject.land(plane)
    end

    it 'stores plane that has landed' do
      expect(subject.storage).to include(plane)
    end

    it 'raises error if weather is stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect {subject.land(plane)}.to raise_error "Storm's a-brewing - Better divert course!"
    end

    it 'raises error if airport is full' do
      allow(subject).to receive(:full?).and_return(true)
      expect {subject.land(plane)}.to raise_error "No room at the Inn - Try another airport!"
    end

    it 'raises error if plane has landed already' do
      expect {subject.land(plane)}.to raise_error "Too late mate - Plane is already down!"
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
      expect {subject.takeoff(plane)}.to raise_error "Storm's a-brewing - Better hold tight!"
    end

    it 'raises error if airport is empty', :empty do
      expect {subject.takeoff(plane)}.to raise_error "No planes available"
    end
  end
end
