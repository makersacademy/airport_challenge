require 'airport'
require 'plane'

describe Airport do
  it "should create a new object" do
    expect(subject).to be_a(Object)
  end
  it "should contain a getter method for the number of planes" do
    expect(subject).to respond_to(:planes) 
  end

end
