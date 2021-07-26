require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new(10) }
  let(:plane) { Plane.new }

  it 'plane lands at airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end 
  
  it 'plane takes_off from airport' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'airport full - planes cannot land' do
    Airport::DEFAULT_CAPACITY.times do
    airport.land :plane
    expect {airport.land :plane } .to raise_error 'Airport full: Cannot land'
    end
  end

  # it 'airport full' do 
  #   if planes == capacity
  #     return 
  context 'when stormy' do
    it 'plane cannnot take_off in stormy weather' do
      allow(airport). to receive(:stormy?).and_return true
      expect { airport.take_off :plane }.to raise_error 'Cannot take off: Weather is stormy'
    
    end
 
    it 'plane cannot land in stormy weather' do
      allow(subject). to receive(:stormy?).and_return true
      expect { subject.land :plane }. to raise_error 'Cannot land: Weather is stormy'
    end

end

end