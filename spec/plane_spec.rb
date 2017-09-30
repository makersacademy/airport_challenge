require 'plane'

describe Plane do

# it { is_expected.to respond_to :arrive_at_airport}

it 'expects the plane to arrive at airport' do
  expect(subject.arrive_at_airport).to eq true
end

end
