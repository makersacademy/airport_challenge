require "plane.rb"
describe Plane do
  it "expects plane to return Flying when flying" do
    subject.instance_variable_set(:@status, "Flying")
    expect(subject.get_status).to eq ("Flying")
  end
  it "planes' status set to Landed when plane lands" do
    expect(subject.land).to eq ("Landed")
  end
  it "planes' status set to Flying when plane takes off" do
    expect(subject.take_off).to eq ("Flying")
  end
end
