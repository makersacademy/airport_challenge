require 'airport'

describe Airport do
  it 'Can hold planes' do
    expect(subject).to respond_to :planes
  end
  it 'Has a maximum capacity of planes that it can hold' do
    expect(subject).to respond_to :capacity
    expect(subject.capacity).not_to be_nil
  end
  it 'allows the default capacity to be overridden as appropriate' do
    expect(subject.capacity = 5).to eq 5
    airport = Airport.new(50)
    expect(airport.capacity).to eq 50
  end
  it 'ensures that the same plane cannot land if it is already in the airport' do
    airport = Airport.new
    plane = Plane.new
    atc = AirTrafficController.new(plane)
    atc.instruct_to_land
    plane.land(airport)
    expect{ plane.land(airport) }.to raise_error "Plane is already on the ground"
  end

end
