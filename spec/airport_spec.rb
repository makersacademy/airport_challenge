require 'airport'

describe Airport do
  it "Shows that Airport instances respond to the safe_to_land? method" do
    expect(subject).to respond_to :safe_to_land?
  end
  it "Shows that safe_to_land will return true if the weather is sunny and airport is not at capacity or false if it is stormy or airport is at capacity" do
    subject.stub(:generate_current_weather) { "sunny" }
    subject.stub(:at_capacity?) {false}
    expect(subject.safe_to_land?).to eq true
    subject.stub(:generate_current_weather) { "sunny" }
    subject.stub(:at_capacity?) {true}
    expect(subject.safe_to_land?).to eq false
    subject.stub(:generate_current_weather) { "stormy" }
    subject.stub(:at_capacity?) {false}
    expect(subject.safe_to_land?).to eq false
    subject.stub(:generate_current_weather) { "stormy" }
    subject.stub(:at_capacity?) {true}
    expect(subject.safe_to_land?).to eq false
  end
  it "responds to the show capacity method" do
    expect(subject).to respond_to :show_capacity
  end
  it "returns a value when the show capacity method is called" do
    expect(subject.show_capacity).to eq @current_capacty
  end
end
