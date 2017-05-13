require 'airport'

describe Airport do
  it "responds to the show capacity method" do
    expect(subject).to respond_to :show_capacity
  end
  it "returns a value when the show capacity method is called" do
    expect(subject.show_capacity).to eq @current_capacty
  end
  it "responds to the change capacity private method" do
    expect(subject).to respond_to :change_capacity
  end
end
