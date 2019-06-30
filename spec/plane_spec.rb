require './lib/plane'

describe Plane do

  it "Changes status of the plane" do
    plane = Plane.new
    plane.report_status(true)
    expect(plane.flying?).to eq true
  end

  it "Check mocked plane status" do
    plane = Plane.new
    plane = double(:plane)
    allow(plane).to receive(:flying?).and_return(true)
    expect(plane.flying?).to eq true
  end

end
