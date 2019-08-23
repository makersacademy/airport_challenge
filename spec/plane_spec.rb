require './lib/plane'

describe Plane do

it 'responds to #land_at_airport' do
expect(subject).to respond_to :land_at_airport
end

it 'allows plane to #land_at_airport' do
expect(subject.land_at_airport).to eq plane
end


 it 'responds to #take_off' do
   expect(subject).to respond_to :take_off
 end
end
