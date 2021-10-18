require 'airport'

describe Airport do 
  it 'instructs a plane to land' do
    my_airport = Airport.new
    my_plane = Plane.new
    allow(my_airport).to receive(:stormy?) { false }
    

    expect(my_airport.land(my_plane)).to eq [my_plane]
  end

  it 'instructs a plane to take off' do
    my_plane = Plane.new
    my_airport = Airport.new
    allow(my_airport).to receive(:stormy?) { false }

    my_airport.land(my_plane)
    expect(my_airport.take_off).to eq (my_plane)
  end

  it 'confirms a plane has taken off' do
    my_plane = Plane.new
    my_airport = Airport.new
    allow(my_airport).to receive(:stormy?) { false }

    my_airport.land(my_plane)
    before_take_off = my_airport.planes_on_ground.count
    
    my_airport.take_off 
    expect(my_airport.planes_on_ground.count).to eq (before_take_off - 1)
  end

  it 'throws an error if airport is full' do 
    my_airport = Airport.new
    my_plane = Plane.new
    allow(my_airport).to receive(:stormy?) { false }

    Airport::DEFAULT_CAPACITY.times { my_airport.land(my_plane) }
    expect { my_airport.land(my_plane) }.to raise_error "Airport is full!"
  end

  it 'sets the capacity to DEFAULT_CAPACITY' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY 
  end

  it 'allows us to set a variable to change the default capacity' do
    my_airport = Airport.new(25)
    expect(my_airport.capacity).to eq (25)  
  end

  it 'throws an error if airport is empty' do 
    my_airport = Airport.new
    allow(my_airport).to receive(:stormy?) { false }

    expect { my_airport.take_off }.to raise_error "no plane on the ground!"
  end

  it 'throws an error if landing and weather is stormy' do 
    my_airport = Airport.new
    my_plane = Plane.new
    allow(my_airport).to receive(:stormy?) { true }

    expect { my_airport.land(my_plane) }.to raise_error "Severe weather condition"
  end

  it 'throws an error if starting and weather is stormy' do 
    my_airport = Airport.new
    my_plane = Plane.new
    my_airport.land(my_plane)
    allow(my_airport).to receive(:stormy?) { true }

    expect { my_airport.take_off }.to raise_error "Severe weather condition"
  end

end
