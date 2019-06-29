
describe "feature test for rspec" do 

  it "airport instructs planes to land " do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end

end
