
require 'airport'

DEFAULT_CAPACITY = 50

describe Airport do
  subject(:airport) { described_class.new}
  let (:plane) { double :plane }

  it { is_expected.to respond_to :land}
  it { is_expected.to respond_to :take_off}

  it "has default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'has the plane after landing' do
    allow(plane).to receive(:land)
    airport.land(plane)
    expect(airport.planes).to include plane
  end

  it "won't allow landing plane if airport full" do
    subject.capacity.times{ subject.land(plane) }
    expect{ subject.land(plane) }.to raise_error "Airport is full. Unable to land."
  end
  
end
