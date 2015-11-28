require 'airport'

describe Airport do
it { should respond_to(:land).with(1).arguments }

it { should respond_to(:take_off) }

it 'should check for plane landed' do
  plane = Plane.new
  subject.land(plane)
  expect(subject.take_off).to eq plane
end


end
