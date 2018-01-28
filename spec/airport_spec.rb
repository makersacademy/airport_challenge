require 'airport'

describe Airport do

  subject(:airport) {described_class.new(weather)}
  let(:airport_2) {described_class.new(weather, 30)}
  let(:plane) {double :status= => nil}
  let(:plane_2) {double :status= => nil}
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
    before(:each) do |test|
      subject.land(plane) unless test.metadata[:empty]
    end

    it 'stores plane that has landed' do
      expect(subject.storage).to include(plane)
    end

    it 'raises error if landed plane tries to land' do
      expect {subject.land(plane)}.to raise_error "Too late mate - Plane is already down!"
    end

    it 'raises error if airport is full', :empty do
      allow(subject).to receive(:full?).and_return(true)
      expect {subject.land(plane)}.to raise_error "No room at the Inn - Try another airport!"
    end
  end

  describe '#takeoff' do

    before(:each) do |test|
      subject.storage << plane unless test.metadata[:empty]
    end

    it 'releases plane' do
      expect(subject.takeoff(plane)).to eq plane
    end

    it 'removes plane from storage' do
      subject.takeoff(plane)
      expect(subject.storage).not_to include plane
    end

    it 'raises error if storage is empty', :empty do
      expect {subject.takeoff(plane)}.to raise_error "No planes available"
    end

    it 'raises error if flying plane tries to take-off' do
      subject.land(plane_2)
      subject.takeoff(plane)
      expect {subject.takeoff(plane)}.to raise_error "You know we are flying right now, right?"
    end
  end

  describe 'stormy scenarios' do

    it 'raises error if plane tries to land during storm' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect {subject.land(plane)}.to raise_error "Storm's a-brewing - Better divert course!"
    end

    it 'raises error if plane tries to take-off during storm' do
      subject.storage << plane
      allow(weather).to receive(:stormy?).and_return(true)
      expect {subject.takeoff(plane)}.to raise_error "Storm's a-brewing - Better hold tight!"
    end
  end
end
