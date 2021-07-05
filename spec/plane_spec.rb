describe Plane do
  it "Will create an instance of Plane" do
    expect(subject).to be_instance_of(Plane)
  end

  it "A random number to determine weather" do
    expect(subject.forecast).to be_between(0, 100)
  end
end