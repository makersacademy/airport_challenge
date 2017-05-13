require 'airport'

describe Airport do
  it "Shows that Airport instances respond to the safe_to_land? method" do
    expect(subject).to respond_to :safe_to_land?
  end
  it "responds to the show capacity method" do
    expect(subject).to respond_to :show_capacity
  end
  it "returns a value when the show capacity method is called" do
    expect(subject.show_capacity).to eq @current_capacty
  end
end
