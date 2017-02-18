require 'weather'

describe Weather do
  before(:each) do
    @weather = double(:weather)
  end
  it "has a is_stormy method" do
    allow(@weather).to receive(:is_stormy?)
    expect(@weather).to respond_to(:is_stormy?)
  end

  it "returns false when not stormy" do
    allow(@weather).to receive(:is_stormy?){false}
    expect(@weather.is_stormy?).to eq false
  end

  it "returns true when stormy" do
    allow(@weather).to receive(:is_stormy?){true}
    expect(@weather.is_stormy?).to eq true
  end
end
