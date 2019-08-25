require 'airport'

describe Airport do

  let(:plane) { double(:plane, :passengers => []) }

  it "can store planes" do
    subject.planes << plane
    expect(subject.planes).to include(plane)
  end

  it "can confirm_departure" do
    allow(plane).to receive(:parcked_in?) { false }
    subject.planes << plane
    subject.stormy = false
    subject.planes.pop
    expect(subject.confirm_departure(plane)).to eq("#{plane} has successfully departed")
  end

end
