require 'airport'

describe Airport do

it "Instructs a plane to land" do
  expect(subject).to respond_to(:land).with(1).argument
end

it "Instructs a plane to takeoff" do
  expect(subject).to respond_to(:takeoff).with(1).argument
end

end
