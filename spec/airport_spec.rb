require 'airport'

describe Airport do
  it { expect(Airport.new).to respond_to(:release_plane) }

  it "docks plane" do
    plane = Plane.new
    subject.dock(plane)
    expect(subject.plane).to eq [plane]
  end

  it "no planes" do
      expect{subject.release_plane}.to raise_error("No planes bitches!")
  end

  it "raises an error when dock is full" do
    subject.dock(Plane.new)
    expect { subject.dock Plane.new }.to raise_error 'Full'
  end
end
