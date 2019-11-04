require './lib/airport'

describe Airport do
  it "makes an instance of the airport class" do
    airport = Airport.new
    expect(airport).to be_instance_of(Airport)
  end
end
