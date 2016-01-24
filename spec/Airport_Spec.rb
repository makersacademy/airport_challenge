require 'Airport.rb'

describe Airport do

it { is_expected.to respond_to(:land).with(1).argument }
it { is_expected.to respond_to :planes_landed }
it { is_expected.to respond_to(:takeoff).with(1).argument}

let(:plane){double :plane}
let(:plane2){double :plane2}
it 'lands a plane' do
  plane = double(:plane)
  expect(subject.land(plane)).to eq [plane]
end

it 'cannot land a plane more than once' do
  plane = double(:plane)
  subject.land(plane)
  expect {subject.land(plane)}.to raise_error ("this plane has already landed")
end


it "shows plane has landed" do
  plane = double(:plane)
  subject.land(plane)
  expect(subject.planes_landed).to eq [(plane)]
  end

=begin
it 'lets a plane takeoff' do
  plane = double(:plane)
  subject.land(plane)
  expect(subject.takeoff(plane)).to eq [plane]
end
=end

it 'lets a specified plane takeoff' do
  plane = double(:plane)
  plane2 = double(:plane2)
  subject.land(plane)
  subject.land(plane2)
  expect(subject.takeoff(plane)).to eq [plane]
end


it 'makes sure you cannot tell a plane to takeoff more than once' do
  plane = double(:plane)
  subject.land(plane)
  subject.takeoff(plane)
  expect {subject.takeoff(plane)}.to raise_error ("this plane has already taken off")
end


end
