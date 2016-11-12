require 'airport'

describe Airport do
  it "should create a new object" do
    expect(subject).to be_a(Object)
  end
  it "should be able to confirm a plane" do
    expect(subject).to respond_to(:confirm).with(1).argument
  end

end
