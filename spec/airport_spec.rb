require "./lib/airport"
describe Airport do
  it "allows a plane to land at airport" do
    expect(subject).to respond_to(:land).with(1).arguments
  end
end
