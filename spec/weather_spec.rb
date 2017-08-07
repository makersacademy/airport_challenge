describe Weather do

  it "can be set to a specific value (default random) and will return good if under 0.8" do
    expect(current_weather(0.1)).to eq "good"
  end

end

# I can't see why this doesn't work for this module.
