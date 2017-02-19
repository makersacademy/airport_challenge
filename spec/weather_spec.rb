require 'weather'

describe Weather do
  before(:each) do
    @weather = Weather.new
  end

  it "responds to is_stormy method" do
    expect(@weather).to respond_to(:is_stormy?)
  end

  it "it's is_stormy? method returns only boolean" do
    expect(@weather.is_stormy?).to be(true).or be(false)
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
