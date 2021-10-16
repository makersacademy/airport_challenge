require_relative '../lib/plane'
require_relative '../lib/airport'
airport = Airport.new
subject = Controller.new
describe Controller do
  # it "should instruct plane to land only if able to land " do
  #   plane = Plane.new
  #   subject.instruct_landing(plane)
  #   expect(airport.spaces[-1]).to eq(plane)
  # end
end
