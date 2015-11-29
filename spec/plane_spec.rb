require 'plane'

describe Plane do
  plane = Plane.new

 it 'confirms plane is in the air' do
  expect(subject).to respond_to(:in_the_air?)
end

 it 'confirms plane has landed' do
   expect(subject).to respond_to(:landed?)
 end
end
