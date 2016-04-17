require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  it { expect(subject).to respond_to(:land).with(1).argument}
  let (:plane) { double :plane }

  it 'instructs plane to land' do
    allow(plane).to receive(:land)
    subject.land(plane)
  end

  it 'confirms plane is in airport' do
    allow(plane).to receive(:land)
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

end