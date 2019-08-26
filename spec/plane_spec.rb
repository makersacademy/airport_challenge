require './lib/plane'

describe Plane do

# it 'responds to #land_at_airport' do
it { is_expected.to respond_to(:land_at_airport).with(1).argument }
# end

# it 'allows plane to #land_at_airport' do
# expect(subject.land_at_airport(airport)).to eq Plane.new
# end

# it 'confirms it is no longer in airport?' do
# expect(subject).to respond_to :not_in_airport?
# end

 # it 'responds to #take_off' do
  it { is_expected.to respond_to(:take_off).with(1).argument }
 end
