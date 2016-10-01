require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do

  before do
    @airport = Airport.new
  end

  it { is_expected.to respond_to :take_off }

  it { is_expected.to respond_to :landing }


  it 'should allow a plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.landing(plane)).to eq plane
  end

  it 'should get a plane, and check it\'s working' do
    plane = Plane.new
    expect(plane.working?).to eq true
  end


end
