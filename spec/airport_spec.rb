require 'airport'
require 'plane'

describe Airport do

  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
    Airport.send(:public, *Airport.private_instance_methods)
  end

  it 'should add a plane to the array when it lands' do
    @airport.land(@plane)
    expect(@airport.planes_in_airport).to eq([@plane])
  end

  it 'should contain an array of the planes in the airport' do
    @airport.land(@plane)
    expect(@airport.planes_in_airport).to eq([@plane])
  end

  it 'should remove a plane from array when instructed to take off and confirm this has been done' do
    @airport.land(@plane)
    @airport.take_off(@plane)
    expect(@airport.take_off(@plane)).to eq "#{@plane} has now left airport"
  end

  it 'should return sunny weather' do
    srand(5)
    expect(@airport.check_weather).to eq("sunny")
  end

  it 'should return stormy weather' do
    srand(6)
    expect(@airport.check_weather).to eq("stormy")
  end

  it 'should only instruct a plane to take off if weather is not stormy' do
    srand(5)
    expect(@airport.confirm_take_off(@plane)).to eq "#{@plane} has now left airport"
  end

  it 'should not instruct a plane to take off if weather is stormy' do
    srand(6)
    expect(@airport.confirm_take_off(@plane)).to eq nil
  end

  it 'should only instruct a plane to land if weather is not stormy' do
    srand(5)
    expect(@airport.confirm_landing(@plane)).to eq @airport.planes_in_airport
  end

  it 'should not instruct a plane to land if weather is stormy' do
    srand(6)
    expect(@airport.confirm_landing(@plane)).to eq nil
  end

  it 'should not accept planes when the airport is full' do
    100.times{@airport.land(@plane)}
    expect {@airport.confirm_landing(@plane)}.to raise_error "No space available"
  end

end
