require "plane"

describe Plane do

  it "Plane default to not be flying" do
    expect(subject.flying?).to eq false
  end

  it "Plane can be set to flying" do
    new_plane = Plane.new(true)
    expect(new_plane.flying?).to eq true
  end

  it "Plane can land" do
    new_plane = Plane.new(true)
    new_plane.land
    expect(new_plane.flying?).to eq false
  end

  it "Plane can takeoff" do
    subject.takeoff
    expect(subject.flying?).to eq true
  end
end
