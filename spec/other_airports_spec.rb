# require 'airport'
# require 'plane'
# require 'weather'
#
# describe Airport do
#   let(:luton) {Airport.new}
#   let(:gatwick) {Airport.new}
#   let(:plane) {Plane.new}
#   context 'when plane in another aiport' do
#     it 'Raises an error' do
#       allow(luton).to receive(:storms?){false}
#       luton.land(plane)
#       expect(gatwick.take_off(plane)).to raise_error "Plane not in this aiport"
#     end
#   end
#
# end
