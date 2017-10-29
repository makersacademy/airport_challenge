require 'airport'

describe Airport do


  subject(:airport) { described_class.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it { is_expected.to respond_to(:stormy?) }

  it 'Receive report if the weather is stormy' do
    expect(subject.stormy?).to be(true).or be(false)
  end

  it 'Confirm the plane has landed' do
    plane = double(:plane)
    allow(subject).to receive(:stormy?).and_return false
    expect(subject.land(plane)).to eq [plane]
  end

  it 'Confirm the plane has taken off' do
    plane = double(:plane)
    allow(subject).to receive(:stormy?).and_return false
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it "Can't take off if weather is stormy" do
    plane = double(:plane)
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.take_off(plane) }.to raise_error(RuntimeError,"It's stormy! We can't fly")
  end

  it "Can't land if weather is stormy" do
    plane = double(:plane)
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.land(plane) }.to raise_error(RuntimeError,"It's stormy! You can't land right now")
  end
end
