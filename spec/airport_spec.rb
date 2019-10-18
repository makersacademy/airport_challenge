require "airport"

describe Airport do
  let(:airport) { Airport.new }

  it "successfully instantiates the airport class" do
    expect(airport).to be_instance_of(Airport)
  end
end
