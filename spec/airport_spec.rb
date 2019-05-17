require 'airport'

describe Airport do 
  let(:airport) {Airport.new}
  let(:plane) {double(:plane)}
  let(:weather) {double(:weather)}

  it 'can land a plane using the land_plane method' do
    allow(plane).to receive(:flying=)
    allow(plane).to receive(:flying)
    allow(plane).to receive(:weather_number).and_return(2)
    
    expect(airport.land_plane(plane)).to eq([plane])
  end

  it 'tells a plane to take off and returns empty landed_planes' do 
    allow(plane).to receive(:flying=)
    allow(plane).to receive(:flying)
    allow(plane).to receive(:weather_number).and_return(2)

    airport.land_plane(plane)

    expect(airport.take_off(plane)).to eq([])
  end 

  it 'can prevent takeoff in stormy weather' do
    allow(plane).to receive(:flying=)
    allow(plane).to receive(:flying)
    allow(plane).to receive(:weather_number).and_return(1)

    expect{airport.take_off(plane)}.to raise_error("too stormy to take off")
  end 

  it 'can prevent landing in stormy weather' do
    allow(plane).to receive(:flying=)
    allow(plane).to receive(:flying)
    allow(plane).to receive(:weather_number).and_return(1)

    expect{airport.land_plane(plane)}.to raise_error("too stormy to land")
  end 
end 