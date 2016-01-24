require 'plane'

describe Plane do

  it 'has a Plane class' do
    expect(subject).to be_a(Plane)
  end

  it 'can respond to \'land\' method with an argument' do
    expect(subject).to respond_to(:land).with(2).arguments
  end

  let(:airport) { double :airport }
  let(:weather) { double :weather }

  it 'can land at airport when safe' do
    plane = Plane.new
    allow(airport).to receive(:stored_planes).and_return(Array.new)
    allow(airport).to receive(:full?) { false }
    allow(weather).to receive(:stormy?) { false }
    plane.land(airport, weather)
    expect(airport.stored_planes).to eq([plane])
  end

  it 'can not land when stormy' do
    allow(weather).to receive(:stormy?) { true }
    allow(airport).to receive(:full?) { false }
    expect{subject.land(airport, weather)}.to raise_error("Unsafe to land")
  end

  it 'can not land when airport is full' do
    allow(airport).to receive(:full?) { true }
    allow(weather).to receive(:stormy?) { false }
    expect{subject.land(airport, weather)}.to raise_error("Airport full")
  end

  it 'stores whether a plane is in flight (true by default)' do
    expect(subject.instance_variable_get(:@in_flight)).to eq(true)
  end

end
