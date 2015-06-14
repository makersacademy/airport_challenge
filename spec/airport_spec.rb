require "airport"

describe Airport do
  it "has a capacity" do
    expect( subject.capacity ).to eq 10
  end
end