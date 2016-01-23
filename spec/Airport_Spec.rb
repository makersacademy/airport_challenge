require 'Airport.rb'

describe Airport do

it { is_expected.to respond_to(:land).with(1).argument }
it { is_expected.to respond_to :planes_landed }

let(:plane){double :plane}

it 'lands a plane' do
  plane = double(:plane)
  expect(subject.land(plane)).to eq [plane]
end

it "shows plane has landed" do
  plane = double(:plane)
  subject.land(plane)
  expect(subject.planes_landed).to eq [(plane)]
  end

end
