require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  it { expect(subject).to respond_to(:land).with(1).argument}
  it { expect(subject).to respond_to(:take_off).with(1).argument}
  let (:plane) { double :plane }


  describe 'landing plane' do
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


  describe 'plane taking_off' do
  let (:plane) { double :plane }
  it 'instructs plane to take off' do
    allow(plane).to receive(:take_off)
    subject.take_off(plane)
  end

  it 'confirms plane left airport' do
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off)
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).not_to include(plane)
  end
  end
end