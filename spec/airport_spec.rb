require 'airport'

describe AirPort do
  
  it "lands a plane in an airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  
end
