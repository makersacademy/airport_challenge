require 'airport'

RSpec.describe Airport do 
  it 'should respond to plane' do
    expect(subject).to respond_to :land
  end
  it 'should instruct plane to land' do 
    plane = subject.land(plane)
    expect(plane).to eq plane
  end
 it 'should put a plane in the hanger when lands' do
  plane = Plane.new
  expect(subject.land(plane)).to eq [plane]
  end

  it 'should respond to take off' do
    expect(subject).to respond_to :take_off
  end
  # it 'should take plane out of hanger when taking off' do
  #   plane = Plane.new
  #   expect(subject.take_off).to eq nil
  # end
  # it 'confirms that it is no longer in the airport' do
  #   plane_one = Plane.new
  #   plane_two = Plane.new
  #   expect(subject.take_off.)
  # end


it 'expected to respond to stormy?' do
  expect(subject).to respond_to :stormy?
end

it 'when stormy? is called it returns a boolean' do
  expect(subject.stormy?).to be(true).or be(false)
end

# it 'prevent takeoff when weather is stormy' do
#   airport = Airport.new.take_off
#   expect(airport.weather.stormy?).to
# end 


  it 'should be able to set to the default capacity if no capacity given' do
    airport = Airport.new
    expect(airport.capacity).to eq 50
  end
  it 'should be able to set airports capacity to a desired capacity' do
    airport = Airport.new(20)
    expect(airport.capacity).to eq 20
end

end