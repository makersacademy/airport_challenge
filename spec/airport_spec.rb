require 'airport'

describe Airport do
  it 'creates an airport constant' do
    my_airport = Airport.new
  end

  it 'tells a plane to land' do
    my_airport = Airport.new
    expect(Airport.new).to respond_to(:land)
  end

  it 'tells a plane to take off' do
    my_airport = Airport.new
    expect(Airport.new).to respond_to(:depart)
  end

  it 'confirms the plane is no longer at the airport' do
    expect { subject.depart }.to raise_error 'Plane has left the airport'
  end
end
