require 'plane'

describe Plane do

  let (:plane) {double :plane}
   it { is_expected.to respond_to :landed }
   it { is_expected.to respond_to :taken_off }

   it 'confirms plane has landed' do
     subject.landed
     expect(subject.in_flight).to be false
   end

   it 'confirms plane has taken_off' do
     subject.taken_off
     expect(subject.in_flight).to be true
   end
end
