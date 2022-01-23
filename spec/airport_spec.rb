require 'airport'

describe Airport do

  before (:each) do
    @airport = Airport.new
    @plane = Plane.new

    @sunny = :sunny
  end

  it 'airport class exists' do

    expect(@airport.class).to eq (Airport)
  end

  # has landing method
  it { is_expected.to respond_to(:land) }

  it 'plane can land' do

    @airport.weather = :sunny

    expect(@airport.land(@plane)).to eq (@airport.landed_planes)
  end

  # has take_off method
  it { is_expected.to respond_to(:take_off) }

  it 'plane can take off' do
    
    @airport.weather = :sunny

    @airport.landed_planes << @plane

    expect(@airport.take_off(@plane).include?(@plane)).to eq(false)
  end

  # has at_airport method
  it { is_expected.to respond_to(:at_airport?) }

  it 'can check if plane is at airport' do
    
    @airport.landed_planes << @plane

    expect(@airport.at_airport?(@plane)).to eq(true)
  end

  it 'has default capacity' do

    expect(@airport.default_capacity.class).to eq(Integer)
  end

  it 'default capacity can be overridden' do

    airport = Airport.new(50)

    expect(airport.capacity).to eq (50)
  end

  it 'cant land plane if airports at capacity' do
    
    20.times { @airport.landed_planes << @plane }

    message = "Can't land plane. Airport is full."
    expect { @airport.land(@plane) }.to raise_error(message)
  end

  it 'raises error if a landed plane tries to land' do
    
    @airport.weather = :sunny

    @airport.land(@plane)

    message = "This plane is already landed!"
    expect { @airport.land(@plane) }.to raise_error(message)
  end

  it 'raises error if flying plane tries to take off again' do
    
    @airport.weather = :sunny

    message = "This plane is not at the airport!"
    expect { @airport.take_off(@plane) }.to raise_error(message)
  end

  it 'prevents take off when weather is stormy' do 
    
    @airport.weather = "stormy"

    message = "Can't take off. It is stormy."
    expect { @airport.take_off(@plane) }.to raise_error(message)
  end

  it 'prevents landing when weather is stormy' do
    
    @airport.weather = "stormy"

    message = "Can't land. It is stormy."
    expect { @airport.land(@plane) }.to raise_error(message)
  end

  it 'takes off and lands multiple planes' do
    planes_to_test = 1000
    airport = Airport.new(planes_to_test)
    
    
    airport.weather = :sunny
    my_planes = []

    planes_to_test.times { my_planes << Plane.new }
    my_planes.each do |i|
      airport.land(i)
    end
    expect(airport.landed_planes.length).to eq (planes_to_test)
    planes_to_test.times { airport.take_off(my_planes.pop) }
    
    expect(airport.landed_planes.length).to eq(0)
  end
end
