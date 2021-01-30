require 'plane'
require 'airport'

RSpec.describe Plane do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it 'Can create an instance of itself' do
    expect(plane).to be_an_instance_of Plane
  end

end