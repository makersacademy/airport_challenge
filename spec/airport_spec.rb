require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do

  before do
    @airport = Airport.new
  end

  it { is_expected.to respond_to :take_off }

  it { is_expected.to respond_to :landing }

  it 'should see that a plane has landed' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.landing(plane)).to eq [plane]
  end

  it 'should not allow planes to land if full' do
    airport = Airport.new(15)
    15.times{airport.landing(Plane.new)}
    plane = Plane.new
    expect { airport.landing(plane)}.to raise_error("There's no room at the inn!")
  end

  it 'should see that a plane has left the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.landing(plane)
    expect(airport.take_off(plane)).to eq plane
  end

  it 'should not let more than 15 planes to land' do
    airport = Airport.new(15)
    15.times{airport.landing(Plane.new)}
    plane = Plane.new
    expect(airport.planes.length).to eq 15
  end

  it 'should have a capacity of 15 when given' do
    airport = Airport.new(15)
    expect(airport.capacity).to eq 15
  end

  it 'should have a default capacity of 20' do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end


  it 'should get a plane, and check it\'s working' do
    plane = Plane.new
    expect(plane.working?).to eq true
  end


end
