require 'weather'

describe Weather do
  before do
    @weather = double(:weather)
  end
  it "has a is_stormy method" do
    allow(@weather).to receive(:is_stormy?)
    expect(@weather).to respond_to(:is_stormy?)
  end
end
