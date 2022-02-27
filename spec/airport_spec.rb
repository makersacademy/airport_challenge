require 'airport'
require 'plane'
require 'weather'

describe Airport do
  it 'Plane can land at the airport' do
    expect(subject).to respond_to(:land_plane)
  end

  it 'Landed plane gets stored at the airport' do
    allow_any_instance_of(Object).to receive(:rand).and_return(8)
    new_plane = Plane.new
    expect(subject.land_plane(new_plane)).to eql([new_plane])
  end

  it 'plane to take off from an airport and confirm that it is no longer in the airport' do
    new_plane = Plane.new
    allow_any_instance_of(Object).to receive(:rand).and_return(2)
    subject.land_plane(new_plane)
    expect(subject.take_off(new_plane)).to eql('Plane left the airport')
    expect(subject.planes).to eq([])
  end 

  it 'plane unable to land when airport capacity is full' do
    allow_any_instance_of(Object).to receive(:rand).and_return(1)
    10.times { subject.land_plane(Plane.new) }
    expect { subject.land_plane(Plane.new) }.to raise_error 'Airport at full capacity'
  end

  it 'Plane unable to take off if already in the air' do
    plane = Plane.new
    airport = Airport.new
    expect { airport.take_off(plane) }.to raise_error 'This plane is already in the air'
  end

  it 'Plane unable to land if it is already grounded' do
    plane = Plane.new
    allow_any_instance_of(Object).to receive(:rand).and_return(6)
    subject.land_plane(plane)
    expect { subject.land_plane(plane) }.to raise_error 'The plane is in the airport already'
  end

  it 'The same plane cannot take off a second time without landing prior to the next take off' do
    allow_any_instance_of(Object).to receive(:rand).and_return(2)
    plane = Plane.new
    subject.land_plane(plane)
    subject.take_off(plane)
    expect { subject.take_off(plane) }.to raise_error 'This plane is already in the air'
  end

  it 'Airport to take argument of 5 and return capacity of 5' do
    airport = Airport.new(5)
    expect(airport.capacity).to eq(5)
  end

  it 'Cannot take of due to stormy weather' do
    allow_any_instance_of(Object).to receive(:rand).and_return(7)
    weather = Weather.new
    plane = Plane.new
    subject.land_plane(plane)
    allow_any_instance_of(Object).to receive(:rand).and_return(9)
    expect { subject.take_off(plane) }.to raise_error 'Weather conditions are not favourable for taking off'
  end

  it '5 defined planes landed into the airport Plane1, Plane2 and Plane4 to take_off in favourable weather conditions. To return Plane3 and Plane 5 in the airport' do
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    plane4 = Plane.new
    plane5 = Plane.new
    allow_any_instance_of(Object).to receive(:rand).and_return(2)
    subject.land_plane(plane1)
    subject.land_plane(plane2)
    subject.land_plane(plane3)
    subject.land_plane(plane4)
    subject.land_plane(plane5)
    expect(subject.planes).to eq([plane1, plane2, plane3, plane4, plane5])
    subject.take_off(plane1)
    subject.take_off(plane2)
    subject.take_off(plane4)
    expect(subject.planes).to eq([plane3, plane5])
  end

  it 'cannot land a plane in one airport and take off from another' do
    heathrow = Airport.new
    gatwick = Airport.new
    plane1 = Plane.new
    allow_any_instance_of(Object).to receive(:rand).and_return(4)
    heathrow.land_plane(plane1)
    expect { gatwick.take_off(plane1) }.to raise_error 'That plane is not in this airport'
  end

  it 'cannot land due to stormy weather' do
    allow_any_instance_of(Object).to receive(:rand).and_return(9)
    weather = Weather.new
    plane = Plane.new
    expect { subject.land_plane(plane) }.to raise_error 'Weather conditions are not favourable for landing'
  end

end
