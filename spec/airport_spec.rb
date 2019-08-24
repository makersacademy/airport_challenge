require 'airport'
describe Airport do
  it "can store planes" do
    expect(subject.planes).to be_instance_of(Array)
  end
end
