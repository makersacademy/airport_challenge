require 'airport'

describe Airport do
  it "Shows that Airport instances respond to the safe_to_land? method" do
    expect(subject).to respond_to :safe_to_land?
  end
  it "Shows that safe_to_land will return true if the weather is sunny and airport is not at capacity or false if it is stormy or airport is at capacity" do
    subject.stub(:generate_current_weather) { "sunny" }
    subject.stub(:at_capacity?) { false }
    expect(subject.safe_to_land?).to eq true
    subject.stub(:generate_current_weather) { "sunny" }
    subject.stub(:at_capacity?) { true }
    expect(subject.safe_to_land?).to eq false
    subject.stub(:generate_current_weather) { "stormy" }
    subject.stub(:at_capacity?) { false }
    expect(subject.safe_to_land?).to eq false
    subject.stub(:generate_current_weather) { "stormy" }
    subject.stub(:at_capacity?) { true }
    expect(subject.safe_to_land?).to eq false
  end
  it "responds to the show capacity method" do
    expect(subject).to respond_to :show_capacity
  end
  it "shows that by default the show capacity method will return 20" do
    expect(subject.show_capacity).to eq 20
  end
  it "Responds to a change capacity method" do
    expect(subject).to respond_to :change_capacity
  end
  it "Shows that show capacity method will return a different value when change capacity is caled with arguments" do
    subject.change_capacity(10)
    expect(subject.show_capacity).to eq 10
    subject.change_capacity(1)
    expect(subject.show_capacity).to eq 1
    subject.change_capacity(9999999)
    expect(subject.show_capacity).to eq 9999999
    subject.change_capacity(164)
    expect(subject.show_capacity).to eq 164
    subject.change_capacity(0)
    expect(subject.show_capacity).to eq 0
  end
end
