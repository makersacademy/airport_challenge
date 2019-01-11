require 'airport'

describe Airport do

  # it 'should respond to the plane_landing method' do
  #   expect(subject).to respond_to(:plane_landing)
  # end

  it { is_expected.to respond_to(:plane_landing).with(1).arguments }

  it 'should allow a plane to land at the airport' do
    expect(subject.plane_landing("easyjet")).to eq ["easyjet"]
  end

  # it 'should respond to the plane_takeoff method' do
  #   expect(subject).to respond_to(:plane_takeoff)
  # end

  it { is_expected.to respond_to(:plane_takeoff).with(1).arguments }

  # it "should raise an error when plane_takeoff is called, airport is empty," do
  #   expect{subject.plane_takeoff(plane)}.to raise_error("No planes available")if (subject.parked_planes.empty?)
  # end

end
