require 'airport'
require 'plane'

describe Airport do
  # subject(:airport) {described_class.new(10)}
  let(:plane) { Plane.new }

  it 'plane lands at airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end 
  
  it 'plane takes_off from airport' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'airport full - planes cannot land' do
    Airport::DEFAULT_CAPACITY.times do
      subject.land(plane)
    end
    expect(subject.land(plane)) .to raise_error 'Airport full: Cannot land'
  end

  it 'plane cannnot take_off in stormy weather' do
    allow(subject). to receive(:stormy?).and_return(true)
    if :stormy == true
      expect { subject.take_off }.to raise_error 'Cannot take off: Weather is stormy'
    end
  end
 

  it 'plane cannot land in stormy weather' do
    allow(subject). to receive(:stormy?).and_return(true)
    if :stormy == true 
      expect { subject.land(plane) }. to raise_error 'Cannot land: Weather is stormy'
    end
  end
end
