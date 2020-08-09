

describe Airport do

  it "airport exists" do
    airport = Airport.new
    expect(airport).to be_an_instance_of(Airport)
  end

end
