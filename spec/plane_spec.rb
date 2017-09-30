require 'plane'

describe Plane do
  it "will show if plane has landed at airport" do
    expect(subject.landed?).to eq true
  end
end
