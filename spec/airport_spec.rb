require 'airport'

describe Airport do
  it "instructs a plane to land" do
    expect(subject).to respond_to :land
  end

  it "instructs a plane to take_off" do
    expect(subject).to respond_to :take_off
  end
end