require "plane.rb"
describe Plane do
  it "expects plane to return Flying when flying" do
    subject.instance_variable_set(:@status, "Flying")
    expect(subject.get_status).to eq ("Flying")
  end
end
