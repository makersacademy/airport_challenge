require 'airport'

describe Airport do
  it "allows a plane to land at the selected airport" do
    expect(subject).to respond_to :land 
  end
end
