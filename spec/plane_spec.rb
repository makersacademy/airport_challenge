require 'plane'

describe Plane do

  let (:plane) {double :plane}
   it { is_expected.to respond_to :landed }
   it { is_expected.to respond_to :took_off }
   it { is_expected.to respond_to :in_flight }

   it 'confirms plane has landed' do
     subject.landed
     expect(subject.in_flight).to be false
   end

   it 'confirms plane has taken off' do
     subject.took_off
     expect(subject.in_flight).to be true
   end
end
