require 'airport'

describe Airport do

  it "can create a new airport" do
    expect(Airport.new).to be_an(Airport)
  end

end
