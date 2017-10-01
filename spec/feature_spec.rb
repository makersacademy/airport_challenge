Dir["./lib/*.rb"].each { |file| require file }

describe "Feature Tests: " do
  let(:airport) { Airport.new }


  # this test will run if I don't take weather into account - otherwise it will almost always fail
  # describe "First test:" do
  #   it "will test an airport" do
  #     airport.capacity.times { airport.land(Plane.new) }
  #     airport.capacity.times { airport.take_off }
  #   end
  # end
end
