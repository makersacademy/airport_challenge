require "plane"
describe Plane do
  it { is_expected.to respond_to :state }
  it " #initialize" do
    expect(subject.state).to eq "flying"
  end

  it "confirm that plane is in air" do
    expect(subject.flying).to eq "flying"
  end
end
