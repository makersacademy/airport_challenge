require 'airport'

describe Airport do

  it "should create a new airport" do
    expect(Airport.new).to be_an_instance_of(Airport)
  end

end
