describe Weather do
  it "selects the weather at random" do
    expect(["sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "stormy"]).to include(subject.condition)
  end

  it "returns sunny" do
    weather = Weather.new
    allow(Kernel).to receive(:rand).and_return("sunny")
    expect(weather.condition).to eq "sunny"
  end

end
