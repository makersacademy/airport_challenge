require 'airport'
require 'airplane'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double :plane}
 
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'instruct a plane to land' do
    allow(plane).to receive (:land)
    subject.land plane
    end

  describe '#land' do
    context 'when not stormy' do
      it 'allowes plane to land' do
        allow(airport).to receive(:stormy?).and_return(false)
        expect {subject.land(plane)}.not_to raise_error
      end
    end

    it { is_expected.to respond_to(:land).with(1).argument }

    context 'when is stormy' do
      it 'does not allow plane to land' do
        allow(airport).to receive(:stormy?).and_return(true)
        expect {subject.land(plane)}.to raise_error 'Cannot land plane due to stormy weather'
      end
    end
  end
    # #context 'when is full' do
 
  describe '#takeoff' do
    context 'when not stormy' do
      it 'allowes plane to takeoff' do
        allow(airport).to receive(:stormy?).and_return(false)
        expect {subject.land(plane)}.not_to raise_error
      end
    end

  it { is_expected.to respond_to(:takeoff).with(1).argument }
 
    context 'when is stormy' do
      it 'does not allow plane to take off' do
        allow(airport).to receive(:stormy?).and_return(true)
        expect {subject.takeoff(plane)}.to raise_error 'Cannot take off due to stormy weather'
      end
    end
  end
end





  





