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

  describe 'land' do
   it 'raises an error when hangar is ful' do
     1.times { subject.land Plane.new}
     expect{ subject.land(plane)}.to raise_error 'Hangar full'
    end
  end
end
