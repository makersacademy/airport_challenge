require 'airport'

describe Airport do
  let (:plane) { double :plane, flying?: true, land!: nil }
  let (:airport) { Airport.new }

  it 'should be empty when created' do
    expect(airport.planes.length).to eq 0 
  end

  it 'allows a plane to land' do
    airport.land(plane)
    expect(airport.planes.length).to eq 1
  end

  it 'the plane is notified that it has landed' do
    
  end
end