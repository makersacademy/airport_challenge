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

  it 'should see that a plane has left the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.landing(plane)
    expect(airport.take_off(plane)).to eq plane
  end


  it 'should get a plane, and check it\'s working' do
    plane = Plane.new
    expect(plane.working?).to eq true
  end


end
