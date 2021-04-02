require "airport"

describe Airport do
  it "Tests if a plane can be instructed to land" do
    expect(subject).to respond_to :instruct_land
  end
end
