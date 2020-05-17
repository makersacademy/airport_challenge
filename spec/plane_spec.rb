require './lib/plane.rb'

describe Plane do

  subject(:plane) { Plane.new }

  it 'responds to #land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'lands at an airport' do
    airport = Airport.new
    expect(subject.land(airport)).to eq airport
  end

  it 'takes off and confirms departure' do
    expect(plane.take_off).to eq "Plane has departed the airport"
  end

  it 'reports there is no space to land' do
    airport = Airport.new
    subject.land(airport)
    expect(subject.has_space_to_land?).to eq false
  end

  it 'reports there is space to land' do
    expect(subject.has_space_to_land?).to eq true
  end

end
