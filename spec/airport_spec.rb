require 'airport'

describe Airport do
  it "has a weather state" do
    expect(subject.weather).to eq true
  end
end
