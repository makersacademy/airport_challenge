require 'airport'
require 'plane'

describe Airport do

  it 'asks a plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it '#take_off(plane) removes plane from @landed_planes' do
    plane = Plane.new
    allow(subject).to receive(:stormy?).and_return(false)
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.landed_planes).not_to include(plane)
  end

  it 'stores landed planes' do
    plane = Plane.new
    allow(subject).to receive(:stormy?).and_return(false)
    subject.land(plane)
    expect(subject.landed_planes).to include(plane)
  end

  it 'asks a plane to take off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'will not take off a plane if it is stormy' do
    plane = Plane.new
    allow(subject).to receive(:stormy?).and_return(true)
    expect { subject.take_off(plane) }.to raise_error('Plane cannot take off because it is stormy')
  end

  it 'will not land a plane if it is stormy' do
    plane = Plane.new
    allow(subject).to receive(:stormy?).and_return(true)
    expect { subject.land(plane) }.to raise_error('Plane cannot land because it is stormy')
  end

  it 'will land a plane if it is not stormy' do
    plane = Plane.new
    allow(subject).to receive(:stormy?).and_return(false)
    expect { subject.land(plane) }.not_to raise_error
  end

  it 'has a default capacity of 20' do
    expect(subject.capacity).to eq 20
  end

  it 'can change the capacity' do
    subject.capacity = 30
    expect(subject.capacity).to eq 30
  end
end
