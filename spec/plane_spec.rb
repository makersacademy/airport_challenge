require 'airport'
describe Plane do
  it "lands a plane at airport" do
    expect(subject).to respond_to :instruct_land
    expect(subject).to respond_to :land?
    subject.instruct_land
    expect(subject.land).to eq true
  end

  it "takes off a plane from airport" do

  end
end
