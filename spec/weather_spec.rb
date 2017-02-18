require 'weather'

describe Weather do
  before do
    @weather = Weather.new
  end
  it "has a is_stormy method" do
    expect(@weather).to respond_to(:is_stormy?)
  end
end
