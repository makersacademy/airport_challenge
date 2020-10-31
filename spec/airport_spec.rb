require 'airport'

describe Airport do
  it "creates with a default capacity" do
    expect(subject.capacity).to eq(50)
  end
end