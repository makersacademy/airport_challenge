require 'airport'

RSpec.describe Airport do
  it 'instructs a plane to land' do
    is_expected.to respond_to(:land).with(1).argument
  end

  it 'instructs a plane to take off' do
    is_expected.to respond_to(:take_off).with(1).argument
  end
  
  it 'instructs to see planes' do
    is_expected.to respond_to(:planes)
  end

  it 'confirms plane landed' do
    plane = double :plane
    allow(Weather).to receive(:current).and_return('clear') 
    subject.land(plane)
    expect(subject.planes).to include plane
  end
  
  it 'confirms plane took off' do
    plane = double :plane
    allow(Weather).to receive(:current).and_return('clear')
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).to_not include plane
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

  it 'prevents take off if not at airport' do
    allow(Weather).to receive(:current).and_return('clear') 
    plane = double :plane
    message = "Cannot Take Off: Plane Not Found"
    expect { subject.take_off(plane) }.to raise_error(message)
  end

  it 'can land multiple planes' do
    subject.capacity = 5
    allow(Weather).to receive(:current).and_return('clear')
    subject.capacity.times { subject.land(Plane.new) }
    expect(subject.planes.length).to eq 5
  end

  it 'can take off multiple planes' do
    subject.capacity = 3
    allow(Weather).to receive(:current).and_return('clear')
    plane_1 = double :plane
    plane_2 = double :plane
    plane_3 = double :plane

    subject.land(plane_1)
    subject.land(plane_2)
    subject.land(plane_3)

    subject.take_off(plane_1)
    subject.take_off(plane_2)
    subject.take_off(plane_3)

    expect(subject.planes).to be_empty
  end
end
