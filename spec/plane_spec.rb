require 'plane'
describe Plane do

  it 'Can receive the "land" command with 2 arguments.' do
    expect(subject).to respond_to(:land).with(2).argument
  end

  it 'Can receive the "take_off" command with 2 arguments.' do
    expect(subject).to respond_to(:take_off).with(2).argument
  end

context 'During stormy weather' do
  it 'Will not be permitted to take-off.' do
    weather = double(:Weather, :stormy? => true)
    airport = double(:Airport, :confirm_plane_landed => true)
    message = 'The weather is too stormy to take-off.'
    expect{subject.take_off(airport, weather)}.to raise_error(message)
  end

  it 'Will not be permitted to land.' do
    weather = double(:stormy? => false)
    airport = double(:confirm_plane_landed => true, :landed_planes => [])
    message = 'The weather is too stormy to land.'
    subject.take_off(airport, weather)
    weather = double(:stormy? => true)
    expect{subject.land(airport, weather)}.to raise_error(message)
  end
end

context 'When airport is using the default capacity' do
  it 'Will not be permitted to land when the airport is full.' do
    weather = double(:stormy? => false)
    default_capacity = 30
    airport = double(:capacity => default_capacity, :landed_planes => [], :confirm_plane_landed => true)
    30.times { airport.landed_planes << :plane }
    message = 'There is no room at the airport.'
    subject.take_off(airport, weather)
    expect{subject.land(airport, weather)}.to raise_error(message)
  end
end

context 'When the airport is using an overriden capacity' do
  it 'Will not be permitted to land when the airport is full.' do
    weather = double(:stormy? => false)
    airport = double(:capacity => 2, :landed_planes => [:p1, :p2], :confirm_plane_landed => true)
    message = 'There is no room at the airport.'
    subject.take_off(airport, weather)
    expect{subject.land(airport, weather)}.to raise_error(message)
  end
end

context 'While the plane is flying' do
  it 'Will not be able to take-off' do
    weather = double(:stormy? => false)
    airport = double(:confirm_plane_landed => true, :landed_planes => [])
    subject.take_off(airport, weather)
    message = 'This plane is already flying.'
    expect{ subject.take_off(airport, weather)}.to raise_error(message)
  end
end

context 'Once the plane has landed' do
  it 'Will not be able to land' do
    weather = double(:stormy? => false)
    airport = double(:confirm_plane_landed => true, :landed_planes => [], :capacity => 30)
    subject.take_off(airport, weather)
    subject.land(airport, weather)
    message = 'This plane has already landed.'
    expect{ subject.land(airport, weather)}.to raise_error(message)
  end
end

end
