require 'plane'

describe Plane do

  it 'cannot #land if already landed' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error 'Plane already landed'
  end

  it 'status can be changed to landed' do
    expect(subject.status = :landed).to eq :landed
  end

  it 'plane status changed to flying on #take_off' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    airport = Airport.new
    airport.land(subject)
    airport.take_off(subject)
    expect(subject.status).to eq :flying
  end

end
