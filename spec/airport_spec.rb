require "airport"

describe Airport do

  it "responds to takeoff" do
  expect(subject).to respond_to :takeoff
  end

  it 'allows a plane to takeoff' do
  expect(subject.takeoff).to be plane
  end

end
