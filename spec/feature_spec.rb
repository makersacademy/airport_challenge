Dir["./lib/*.rb"].each { |file| require file }

describe "Feature Tests: " do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
end
