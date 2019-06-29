
describe "feature test for rspec" do

  it "airport instructs planes to land " do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end


#   As an air traffic controller
#   So I can get passengers on the way to their destination
#   I want to instruct a plane to take off from an airport and confirm that it is no longer
it 'for planes to take off from the aiport' do
  airport = Airport.new
  plane = Plane.new
  expect { airport.take_off(plane) }.to raise_error "No planes available"
end
end
