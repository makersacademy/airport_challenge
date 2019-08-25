require "plane.rb"
describe Plane do
  it "expects plane to return Flying when flying" do
    subject.instance_variable_set(:@status, "Flying")
    expect(subject.get_status).to eq ("Flying")
  end
  it "find the planes airport if landed" do
    subject.instance_variable_set(:@airport, "James Airport")
    expect(subject.get_airport).to eq ("James Airport")
  end
  it "planes' status set to Landed when plane lands" do
    expect(subject.land("test airport")).to eq ("Landed")
  end
  it "planes' status set to Flying when plane takes off" do
    subject.instance_variable_set(:@airport, "James Airport")
    expect(subject.take_off("James Airport")).to eq ("Flying")
  end
  it "plane can't take off if it's already flying" do
    subject.instance_variable_set(:@status, "Flying")
    subject.instance_variable_set(:@airport, "James Airport")
    expect{subject.take_off("James Airport")}.to raise_error ("Plane can't take off, it's already flying")
  end
  it "plane can't land it's already landed" do
    subject.instance_variable_set(:@status, "Landed")
    expect{subject.land("test airport")}.to raise_error ("Plane can't land, it's already on the ground")
  end
  it "plane can't take off from airport if not at the airport" do
    subject.instance_variable_set(:@airport, "Makers Airport")
    expect{subject.take_off("James Airport")}.to raise_error ("Plane can't take off, it's at another airport")
  end
end
