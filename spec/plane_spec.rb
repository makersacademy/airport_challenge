require 'plane'

describe Plane do
  let (:plane) {Plane.new}

 it 'confirms plane is in the air' do
  expect(plane).to respond_to(:in_the_air?)
end

 it 'confirms plane has landed' do
   expect(plane).to respond_to(:landed?)
 end
end
