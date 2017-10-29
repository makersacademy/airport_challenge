require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off) }

  it { is_expected.to respond_to(:stormy?) }

  it 'Checking if weather in the airport is stormy' do
    expect(subject.stormy?).to be(true).or be(false)
  end

  it 'Confirm the plane has landed' do
    obj = double(:plane)
    allow(subject).to receive(:stormy?).and_return false
    expect(subject.land(obj)).to eq [obj]
  end

  it 'Confirm the plane has taken off' do
    obj = double(:plane)
    allow(subject).to receive(:stormy?).and_return false
    subject.land(obj)
    expect(subject.take_off).to eq obj
  end

  it "Raises an error can't take off if weather is stormy" do
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.take_off }.to raise_error(RuntimeError, "It's stormy! We can't fly")
  end

  it "Raises an error can't land if weather is stormy" do
    obj = double(:plane)
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.land(obj) }.to raise_error(RuntimeError, "It's stormy! You can't land right now")
  end

  it "Raises an error concerning airport being full with default capacity" do
    obj = double(:plane)
    allow(subject).to receive(:stormy?).and_return false
    subject.capacity.times { subject.land(obj) }
    expect { subject.land(obj) }.to raise_error("Airport is full")
  end
end
