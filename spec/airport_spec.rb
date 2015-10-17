require 'airport'

describe AirPort do
  it "lands planes safely at airport" do
    expect(subject).to respond_to :land_safely
  end
end
