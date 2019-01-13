require 'airport'

RSpec.describe Airport do
  it 'instructs a plane to land' do
    is_expected.to respond_to(:land).with(1).argument
  end

  it 'instructs a plane to take off' do
    is_expected.to respond_to(:take_off).with(1).argument
  end
  
  it 'instructs to see planes' do
    is_expected.to respond_to(:plane)
  end

  it 'confirms plane landed' do
    plane = double :plane
    allow(Weather).to receive(:current).and_return('clear') 
    subject.land(plane)
    expect(subject.plane).to eq plane
  end
  
  it 'confirms plane took off' do
    plane = double :plane
    allow(Weather).to receive(:current).and_return('clear')
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.plane).to_not eq plane
  end

  it 'prevents take off if stormy' do
    plane = double :plane
    allow(Weather).to receive(:current).and_return('clear')
    subject.land(plane)
    allow(Weather).to receive(:current).and_return('stormy')
    message = 'Cannot Take Off: Turbulent Weather'
    expect { subject.take_off(plane) }.to raise_error(message)
  end

  it 'prevents landing if stormy' do
    plane = double :plane
    allow(Weather).to receive(:current).and_return('stormy')
    message = 'Cannot Land: Turbulent Weather'
    expect { subject.land(plane) }.to raise_error(message)
  end

  it 'prevents landing when the airport is full' do
    plane = double :plane
    allow(Weather).to receive(:current).and_return('clear')
    subject.land(plane)
    message = 'Cannot Land: Airport Full' 
    expect { subject.land(plane) }.to raise_error(message)
  end

  it 'has a default capacity of 1' do
    expect(subject.capacity).to eq 1
  end

  it 'can change capacity' do
    subject.capacity = 5
    expect(subject.capacity).to eq 5
  end
end
