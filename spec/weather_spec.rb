require 'weather'

describe Weather do
  before(:each) do
    @weather = Weather.new
  end
  it "shows that it is sunny" do
    allow(@weather).to receive(:forecast).and_return('sunny')
    expect(@weather.forecast).to eq 'sunny'
  end
  it "shows that it is stormy" do
    allow(@weather).to receive(:forecast).and_return('stormy')
    expect(@weather.forecast).to eq 'stormy'
  end
end
