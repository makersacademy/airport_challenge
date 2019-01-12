require 'airport'
require 'plane'

describe Airport do

  before(:each) do
    Airport.send(:public, *Airport.private_instance_methods)
    @plane = Plane.new
    @airport = Airport.new
  end

# storing planes

  it 'should stored landed planes in an array in the airport' do
    @airport.land(@plane)
    expect(@airport.planes_in_airport).to eq([@plane])
  end

  it 'should remove a plane from array on take off and confirm' do
    @airport.land(@plane)
    expect(@airport.take_off(@plane)).to eq "#{@plane} has now left airport"
  end

# weather check

  it 'should return true if sunny' do
    srand(5)
    expect(@airport.weather_ok?).to eq(true)
  end

  it 'should return false if stormy' do
    srand(6)
    expect(@airport.weather_ok?).to eq(false)
  end

# flight patterns as a result of weather
  it 'should allow planes to take off if weather is not stormy' do
    srand(5)
    @airport.land(@plane)
    expect(@airport.confirm_take_off(@plane)).to eq "#{@plane} has now left airport"
  end

  it 'should not allow planes to take off if weather is stormy' do
    srand(6)
    @airport.land(@plane)
    expect(@airport.confirm_take_off(@plane)).to eq nil
  end

  it 'should allow planes to land if weather is not stormy' do
    srand(5)
    expect(@airport.confirm_landing(@plane)).to eq @airport.planes_in_airport
  end

  it 'should allow planes to land if weather is stormy' do
    srand(6)
    expect(@airport.confirm_landing(@plane)).to eq nil
  end

# capacity

  it 'should not allow planes to land when the airport is full' do
    100.times { @airport.land(Plane.new) }
    expect { @airport.confirm_landing(@plane) }.to raise_error "No space available"
  end

  it 'should not accept planes when the airport of capacity 50 is full' do
    airport50 = Airport.new(50)
    50.times { airport50.land(Plane.new) }
    expect { airport50.confirm_landing(@plane) }.to raise_error "No space available"
  end

  # edge cases

  it 'should not allow the same plane to land twice (without taking off between)' do
    @airport.land(@plane)
    expect { @airport.confirm_landing(@plane) } .to raise_error "This plane is already in the airport"
  end

  it 'plane must be in airport in order to take off' do
    expect { @airport.confirm_take_off(@plane) } .to raise_error "This plane is not in the airport"
  end

  it 'should not allow a plane to land if it is in any airport' do
    airport2 = Airport.new
    airport2.land(@plane)
    expect { @airport.confirm_landing(@plane) } .to raise_error "This plane is in another airport"
  end

end
