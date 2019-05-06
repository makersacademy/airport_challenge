require 'airport'

describe Airport do

  it 'will instruct a plane to land if sunny' do
    allow(subject.weather).to receive(:stormy?).and_return(false)
    expect(subject.land(Plane.new)).to eq('Cleared to land')
  end

  it 'will not allow a plane to land if it is stormy' do
    allow(subject.weather).to receive(:stormy?).and_return(true)
    expect { subject.land(Plane.new) }.to raise_error('Plane cannot land due to bad weather')
  end

  it 'will not allow a plane to land if the airport is full' do
    message = 'Airport full, permisson to land denied'
    allow(subject).to receive(:full?).and_return(true)
    expect { subject.land(Plane.new) }.to raise_error message
  end

  it 'will instruct a plane to take off if sunny' do
    allow(subject.weather).to receive(:stormy?).and_return(false)
    expect(subject.take_off).to eq('Cleared for take off')
  end

  it 'will ground planes if it is stormy' do
    allow(subject.weather).to receive(:stormy?).and_return(true)
    expect { subject.take_off }.to raise_error('Planes are grounded due to bad weather')
  end
end
