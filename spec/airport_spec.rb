require "airport"

describe Airport do

  #1
  it "checks existance of the class Airport" do
    expect(subject.class).to eq Airport
  end

  #2
  it "plane can land at airport - land method" do
    expect(subject).to respond_to(:land).with(1).argument
  end



end
