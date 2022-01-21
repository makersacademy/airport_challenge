require './lib/airport.rb'

describe Airport do 
  it "is the airport at full capacity" do 
    airport = Airport.new
    expect(airport).to respond_to(:full_capacity?)
  end
end