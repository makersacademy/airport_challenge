require 'airport'

describe Airport do
  let(:plane) { double :plane }
  let(:airport) { Airport.new("Heathrow") }
  let(:landed_plane) do
    allow(airport).to receive(:stormy?).and_return(false)
    airport.land(plane)
  end
  
  it 'plane is added to @planes on landing' do
    expect(landed_plane).to eq [plane]
  end

  it 'raises error if landed plane is asked to land again' do
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error 'Plane already landed.'
  end

  it 'raises error if flying plane is asked to take off again' do
    expect { airport.take_off(plane) }.to raise_error "Plane already airborne."
  end

  it 'plane is removed from to @planes on take off' do
    landed_plane
    expect(airport.take_off(plane)).to eq plane
  end
  
  it 'raises error when airport is full' do
    allow(airport).to receive(:stormy?).and_return(false)
    airport.land("plane1")
    airport.land("plane2")
    airport.land("plane3")
    expect { airport.land(plane) }.to raise_error 'Airport full. Capacity is 3.'
  end

  it 'enables airport capacity to be overridden' do
    new_airport = Airport.new("Gatwick", 2)
    allow(new_airport).to receive(:stormy?).and_return(false)
    new_airport.land("plane1")
    new_airport.land("plane2")
    expect { new_airport.land(plane) }.to raise_error 'Airport full. Capacity is 2.'
  end

  it 'prevents take off when weather is stormy' do
    landed_plane
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.take_off(plane) }.to raise_error "Can't fly in stormy weather."
  end

  it 'prevents landing when weather is stormy' do
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.land(plane) }.to raise_error "Can't land in stormy weather."
  end
end
