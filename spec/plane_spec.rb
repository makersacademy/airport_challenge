require 'plane'

describe Plane do

it 'expects the plane to arrive at airport' do
  expect(subject.arrive_at_airport).to eq true
end

 #it { is_expected.to respond_to :depart_from_airport}
 it 'expects the plane to depart from airport' do
   expect(subject.depart_from_airport).to eq true
 end

end
