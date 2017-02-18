# require 'plane'
#
# landed = [1]
#
# describe Plane do
#
#   describe '#confirm_landed?' do
#     it 'confirms plane has landed' do
#       1.times { subject.land_plane Plane.new }
#       expect(subject.confirm_landed?).to eq true
#     end
#   end
#
#   describe '#take_off' do
#     it 'plane takes off / confirm it left airport' do
#       x = Plane.new
#       taken_off = []
#       landed = []
#       landed << x
#       taken_off << landed.pop
#       #landed = []
#       #taken_off = []
#     #  landed << Plane.new
#       #taken_off << landed.pop
#       #1.times { subject.take_off taken_off }
#       expect(subject.taken_off?).to eq x
#     end
#   end
# end
