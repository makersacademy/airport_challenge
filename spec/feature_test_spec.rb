require 'plane'
require 'airport'
require 'weather'


describe 'Air Traffic Control' do
  heathrow = Airport.new('Heathrow', 30)
  boeing747 = Plane.new
  let(:weather) {Weather.new}

  #User Story 1
  it 'can land a plane' do
    allow(weather).to receive(:stormy?).and_return false
    heathrow.land_plane(boeing747, weather)
    puts "The plane has landed at #{heathrow.name} = #{boeing747.landed?}"
  end

  #User Story 2
  it 'can instruct a plane to take off' do
    allow(weather).to receive(:stormy?).and_return false
    heathrow.take_off(boeing747, weather)
    puts "The plane is still at #{heathrow.name} = #{boeing747.landed?}"
  end

  #User Story 2
  it 'can check a plane has left the airport' do
    p boeing747.landed?
  end

  #User Story 3
  it 'will not allow a plane to land in stormy weather' do
    allow(weather).to receive(:stormy?).and_return true
    expect { heathrow.land_plane(boeing747, weather) }.to raise_error "Sorry, too stormy to land!"
  end

  #User Story 4
  it 'will not allow a plane to take off in stormy weather' do
    allow(weather).to receive(:stormy?).and_return false
    heathrow.land_plane(boeing747, weather)
    allow(weather).to receive(:stormy?).and_return true
    expect { heathrow.take_off(boeing747, weather) }.to raise_error "Sorry, too stormy to take off!"
  end

  #User Story 5
  it 'will not allow a plane to land if capacity full' do
    allow(weather).to receive(:stormy?).and_return false
    19.times { heathrow.land_plane(Plane.new, weather) }
    expect { heathrow.land_plane(Plane.new, weather) }.to raise_error "Sorry airport is full!"
  end

  #User Story 6
  it 'will allow an administrator to change the default capacity of an airport' do
    jfk = Airport.new('JFK', 40)
    puts "#{jfk.name}'s capacity is #{jfk.capacity} planes"
  end

end
