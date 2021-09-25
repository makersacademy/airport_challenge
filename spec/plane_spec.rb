require "plane"
describe Plane do
  it "confirms that plane is no longer in the airport" do
    expect(subject.departed).to eq true
  end
end
