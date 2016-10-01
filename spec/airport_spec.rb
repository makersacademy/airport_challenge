require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do

  before do
    airport = Airport.new
  end


  describe 'it should allow a plane to take-off' do
    it { is_expected.to respond_to :take_off }
  end

  describe 'it should allow a plane to land' do
  it { is_expected.to respond_to :landing }
  end

  it 'should get a plane, and check it\'s working' do
    plane = Plane.new
    expect(plane.working?).to eq true
  end

end
