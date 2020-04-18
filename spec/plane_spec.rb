require 'plane'

describe Plane do
  it "can land at airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end
  
end