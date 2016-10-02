require 'airport'
describe Plane do

  it {is_expected.to respond_to :land?}

  it "lands a plane at airport" do
    expect(subject).to respond_to :instruct_land
    subject.instruct_land
    expect(subject.land).to eq true
  end

  it "takes off a plane from airport" do
    expect(subject).to respond_to :instruct_takeoff
    subject.instruct_takeoff
    expect(subject.land).to eq false
  end
end
