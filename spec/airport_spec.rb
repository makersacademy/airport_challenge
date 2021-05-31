require 'airport'
require 'airplane'


describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double :plane}
  let(:weather) {double :weather}
  
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    subject { Airport.new }
    let (:plane) {Plane.new}
    it 'default capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
     end
    expect {subject.land(plane)}.to raise_error 'Cannot land since airport is full'
   end
  end

  describe 'landing planes' do
    it 'instruct a plane to land' do
    allow(plane).to receive (:land)
    subject.land plane
    end

    it 'has the plane after it has landed' do
      allow(plane).to receive(:landed)
      expect(subject.land(plane)).to include(plane)
    end
  end

  context 'when is stormy' do
    it 'does not allow plane to take off' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect {subject.takeoff}.to raise_error 'Cannot take off due to stormy weather'
    end
  end
end




