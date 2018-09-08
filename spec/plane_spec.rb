require 'plane'

RSpec.describe Plane do

  subject(:plane) { Plane.new }

  it 'should land at an airport' do
    expect(plane.land).to be :grounded
  end

  it 'should take off from an airport' do
    expect(plane.take_off).to be :flying
  end

end
