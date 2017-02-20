require 'plane'
require 'airport'

describe Plane do
  subject(:plane) {described_class.new}
  let(:airport) { double :airport }

# # => Status of plane Test
#   describe 'will change current_position' do
#     it 'status will be landed when in an airport' do
#       allow(airport).to receive(:successful_landing)
#       airport.successful_landing(Plane.new)
#       expect(Plane.new.status). to eq 'landed'
#     end
#   end

  # it 'plane is already flying' do
  #   airport.permission_to_land(subject)
  #   airport.permission_to_take_off
  #   expect{ airport.permission_to_take_off }.to raise_error("The plane is already flying")
  #   end
  # end

end
