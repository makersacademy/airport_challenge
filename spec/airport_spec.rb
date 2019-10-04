require './lib/airplane'
require './lib/airport'
describe Airport do
  it 'instructs plane to land' do
    plane = Airplane.new
    subject.land(plane)
    expect(subject.inventory).to include(plane)
  end
  it 'checks plane is gone' do
    plane = Airplane.new
    subject.land(plane)
    subject.fly(plane)
    expect(subject.inventory).to eq([])
  end
  it 'will not land when no space' do
    plane = Airplane.new
    subject.capacity.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error 'no room'
  end
  it 'trys having a input capacity' do
    airport, plane = Airport.new(11), Airplane.new
    airport.capacity.times { airport.land(plane) }
    expect(airport.capacity).to eq(11)
  end
  it 'otherwise sets a default value of five' do
    airport, plane = Airport.new, Airplane.new
    airport.capacity.times { airport.land(plane) }
    expect(airport.capacity).to eq(5)
  end
  it 'does not takeoff if stormy' do
    plane = Airplane.new
    subject.land(plane)
    subject.conditions('stormy')
    expect { subject.fly(plane) }.to raise_error 'bad wheather'
  end
  it 'does not land when stormy' do
    plane = Airplane.new
    subject.conditions('stormy')
    expect { subject.land(plane) }.to raise_error 'bad wheather'
  end
end
