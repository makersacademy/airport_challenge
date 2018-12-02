require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
   let(:airport) {Airport.new}
   let (:plane) {Plane.new}
   it { is_expected.to respond_to(:land).with(1).arguments }

   it 'Lands and keeps a plane' do
     expect(airport.land(plane)).equal? plane
   end

   it 'Lets a plane take off' do
     expect(subject.take_off).to eq nil

   end
end


#it 'docks a bike' do
#  bike = Bike.new
#  expect(subject.dock(bike)).equal? bike
#end
