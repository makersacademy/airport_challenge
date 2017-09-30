require "airport"

describe Airport do

  it "responds to takeoff" do
  expect(subject).to respond_to :takeoff
  end

  it 'allows an airport to let a plane takeoff' do
  expect(subject.takeoff).to be_instance_of(Plane)
  end

  it 'responds to land' do
    expect(subject).to respond_to :land
  end

end
