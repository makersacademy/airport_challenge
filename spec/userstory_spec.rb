describe "user stories" do
  it "allows planes to lands at airports and instructs a plane to land" do
  airport = Airport.new(20)
  plane = Plane.new
  expect { airport.land(plane) }.not_to raise_error
=begin
I have created a new airport and a plane. I expect that at the aiport
  when there is a plane it is allowed to and instructed to land.
=end
  end

  it "allowing airport to instruct planes to land and take off" do 
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end
=begin
i have crated a new aiport and plane. I expect that the method take_off will be called and
will be passed a plane to allow/instruct it to take off.
=end

  it "allowing the airport to safely prevent planes from landing if airport is full" do
  airport = Airport.new(20) #20 is the current capacity for the airport that I am passing through
  plane = Plane.new
  20.times do
    airport.land(plane) #20 times i am trying to land the plane
  expect { airport.land(plane) }.to raise_error "You have reached the maximum ammount of planes that can land. The airport is now full"
  end
end

end
