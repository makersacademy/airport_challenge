require "airport"

describe Airport do
  subject(:airport) { described_class.new(20) }
=begin
  defining what subject actually is. Subject is equal to the class I am describing.new
  described_class takes the class we are decribing and gives us back a new version of it.
  sets what I am describing equal to subject.
=end
  it "airport is expected to respond to land" do 
  expect(airport).to respond_to(:land).with(1).argument
=begin
  telling rspec to expect that aiport will expect the method land to
  take one argument. Currently that one argument is plane.
=end
  end 

  it "instructs a plane to take off " do
    expect(airport).to respond_to(:take_off).with(1).argument
=begin
  telling rspec to expect that aiport will expect the method take off will
  take one argument. Currently that one argument is plane.
=end
  end
  it "will not allow planes to land when the capscity of the airport is full"
  20.times do
    aiport.land(plane)
  expect { airport.land(plane) }.to raise_error "You have reached the maximum ammount of planes that can land. The airport is now full"
  end
=begin
 this is checking that if we land 20 planes (or run this 20 times) we will
 get an error on the 21st time as the capacity currently of the airport is 20 so
 therefore a 21st plane cannot be allowed to land. 
=end
end