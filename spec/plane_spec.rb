require 'plane.rb'

describe Plane do

  it { is_expected.to respond_to(:land) }

  it { is_expected.to respond_to(:land).with(1).argument }

#   it 'lands a plane at an airport' do
#     plane = Plane.new
#     expect(plane.land('airport')).to eq(plane)
#   end

end