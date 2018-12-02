require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
   let(:airport) {Airport.new}
   let (:plane) {Plane.new}
   it { is_expected.to respond_to(:land).with(1).arguments }

   it 'Lands and keeps a plane' do
     expect(airport.land(plane)).to eq plane
   end
end


#it 'docks a bike' do
#  bike = Bike.new
#  expect(subject.dock(bike)).equal? bike
#end
