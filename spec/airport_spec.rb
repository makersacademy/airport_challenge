require 'airport'

RSpec.describe Airport do
  it {is_expected.to respond_to(:land)}
  it "instructs plane to land at airport" do
    expect(subject.land).to eq(true)
  end

  it {is_expected.to respond_to(:take_off)}

  it "instructs plane to take off and confirm leaves airport" do
    expect(subject.take_off).to eq(true)
  end
end
