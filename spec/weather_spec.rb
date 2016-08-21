require 'weather.rb'

describe Weather do

  it "is stormy" do
    expect(subject.weather).to eq "stormy"
  end
end
