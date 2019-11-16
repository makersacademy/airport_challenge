require './lib/airport'

describe Airport do

  # check that airport is an instance of the Airport class
  it "expect airport be an instance of Airport" do
    airport = Airport.new
    expect(airport).to be_instance_of(Airport)
  end


  # next

end
