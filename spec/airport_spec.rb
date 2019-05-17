require 'airport'

describe Airport do 
  let(:airport) { Airport.new }
  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }

  it 'can land a plane using the land_plane method' do
    allow(plane).to receive(:flying=)
    allow(plane).to receive(:flying)
    allow(weather).to receive(:weather_number).and_return(2)
    
    expect(airport.land_plane(plane, weather)).to eq([plane])
  end

  it 'tells a plane to take off and returns empty landed_planes' do 
    allow(plane).to receive(:flying=)
    allow(plane).to receive(:flying)
    allow(weather).to receive(:weather_number).and_return(2)

    airport.land_plane(plane, weather)

    expect(airport.take_off(plane, weather)).to eq([])
  end 

  it 'can prevent landing in stormy weather' do
    allow(plane).to receive(:flying=)
    allow(plane).to receive(:flying)
    allow(weather).to receive(:weather_number).and_return(1)

    expect { airport.take_off(plane, weather) }.to raise_error("too stormy to take off")
  end 

  it 'can prevent landing if plane is already landed' do
    allow(plane).to receive(:flying=)
    allow(plane).to receive(:flying).and_return(false)
    allow(weather).to receive(:weather_number).and_return(2)

    expect { airport.land_plane(plane, weather) }.to raise_error("plane already landed")
  end 

  it 'can prevent take off if plane already flying' do
    allow(plane).to receive(:flying=)
    allow(plane).to receive(:flying).and_return(true)
    allow(weather).to receive(:weather_number).and_return(2)

    expect { airport.take_off(plane, weather) }.to raise_error("plane already flying")
  end 
 
  it 'can prevent landing in stormy weather' do
    allow(plane).to receive(:flying=)
    allow(plane).to receive(:flying)
    allow(weather).to receive(:weather_number).and_return(1)

    expect { airport.land_plane(plane, weather) }.to raise_error("too stormy to land")
  end 

  it 'can check if airport is full' do 
    allow(plane).to receive(:flying=)
    allow(plane).to receive(:flying)
    allow(weather).to receive(:weather_number).and_return(2)

    airport = Airport.new(1)
    airport.land_plane(plane, weather)

    expect { airport.land_plane(plane, weather) }.to raise_error("airport is full, landing not possible")
  end 

end
