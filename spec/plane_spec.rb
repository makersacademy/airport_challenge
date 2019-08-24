require 'plane'
describe Plane do
  it "can hold passengers" do
    expect(subject.passengers).to be_instance_of(Array)
  end
end
