require "airport"

describe Airport do
  subject(:airport) { described_class.new }
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
end