require 'airport'

describe Airport do

  let(:plane) { double(:plane) }

  it 'can be assigned a name, but defaults to being called Heathrow' do
    expect(subject.name).to eq 'Heathrow'
    jfk = Airport.new "John F Kennedy"
    expect(jfk.name).to eq "John F Kennedy"
  end

  it 'allows new planes to be delivered to it' do
    subject.deliver_new_plane plane
    expect(subject.parked_planes[-1]).to eq plane
  end

  it 'does not allow same plane to be delivered to it more than once' do
    subject.deliver_new_plane plane
    expect { subject.deliver_new_plane plane }.to raise_error 'Plane already there'
  end

  it 'allows planes to land' do
    subject.register_arrival plane
    expect(subject.parked_planes[-1]).to eq plane
  end

  it 'allows planes to take off' do
    subject.register_arrival plane
    subject.register_departure plane
    expect(subject.parked_planes).not_to include plane
  end

  it 'allows air traffic controllers to check if a plane is parked at it' do
    subject.register_arrival plane
    expect(subject.check_for_plane plane).to eq true
    subject.register_departure plane
    expect(subject.check_for_plane plane).to eq false
  end

  it 'has a default capacity of 30 planes' do
    expect(subject.capacity).to eq 30
  end

  it 'allows the system administrator to alter the capacity of each airport' do
    expect(Airport.new('Bristol', 40).capacity).to eq 40
    expect(Airport.new('Manchester', 20).capacity).to eq 20
  end

  it 'allows air traffic controllers to check if it is full' do
    airport = Airport.new('Paris Charles de Gaulle', 25)
    expect(airport.full?).to eq false
    25.times { airport.register_arrival plane }
    expect(airport.full?).to eq true
  end

end
