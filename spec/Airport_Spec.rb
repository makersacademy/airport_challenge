require 'Airport.rb'

describe Airport do
it { is_expected.to respond_to(:land).with(1).argument }

let(:plane){double :plane}

it 'lands a plane' do
  plane = double(:plane)
  expect(subject.land(plane)).to eq plane
end



end
