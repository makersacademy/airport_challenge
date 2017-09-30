require "airport"

describe Airport do

  it "responds to takeoff" do
  expect(subject).to respond_to :takeoff
  end

  it 'allows an airport to let a plane takeoff' do
  expect(subject.takeoff).to be_instance_of(Plane)
  end

  it 'has the land method receive a plane' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'land returns plane when a plane lands' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'responds to plane' do
    expect(subject).to respond_to :plane
  end

  it 'returns plane when method is called' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

end
