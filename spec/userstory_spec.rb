describe "user stories" do
  it "allows planes to lands at airports and instructs a plane to land" do
  airport = Airport.new
  plane = Plane.new
  expect { airport.land(plane) }.not_to raise_error
=begin
I have created a new airport and a plane. I expect that at the aiport
  when there is a plane it is allowed to and instructed to land.
=end
  end

  it "allowing airport to instruct planes to land and take off" do 
    airport = Airport.new
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end
=begin
i have crated a new aiport and plane. I expect that the method take_off will be called and
will be passed a plane to allow/instruct it to take off.
=end

end
