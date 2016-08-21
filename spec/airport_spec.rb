require 'airport'
require 'weather'

describe Airport do

  it "can land " do
    expect(subject).to respond_to :land
  end

  it "make a plane land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  # redundant
  # it "has the ability to store a plane" do
  #   expect([]).to be_empty
  # end

  it "can store planes" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.landed_planes).to include plane
  end

  it "responds to #takeoff method" do
    expect(subject).to respond_to(:takeoff).with(1).argument
  end

  it "no longer contains that plane in @landed_planes after takeoff" do
    plane = Plane.new
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.landed_planes).not_to include plane
  end

  it "raises error when full to capacity" do
    4.times { subject.land(Plane.new) }
    expect{ subject.land(Plane.new)}.to raise_error "No space"
  end

    # describe "initialization" do
    #   subject {Airport.new}
    #   let(:plane) {Plane.new}
    #   it "defaults capacity" do
    #     described_class::DEFAULT_CAPACITY.times do
    #       subject.land(plane)
    #     end
    #     expect { subject.land(plane) }.to raise_error "No space"
    #   end
    # end

end
