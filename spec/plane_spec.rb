require 'airport'
require 'plane'

describe Plane do
  it "Plane can take off" do
    expect(subject.take_off).to eq true
  end

  it "Plane can take land" do
    expect(subject.land).to eq true
  end

  it "Status checked" do
    plane_status = subject.status
    expect(subject.status).to eq(plane_status)
  end
end
