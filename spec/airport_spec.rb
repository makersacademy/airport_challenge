require 'airport'

describe Airport do
  it "responds to the show capacity method" do
    expect(subject).to respond_to :show_capacity
  end
end
