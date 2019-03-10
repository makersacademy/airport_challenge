require 'weather.rb' # links the main code to the test file.

describe Weather do
  before(:each) do
    @weather = Weather.new
  end

  it 'responds to forecast' do
    expect(subject).to respond_to :forecast
  end

  it 'returns either stormy or clear when forecast is called' do
    expect(@weather.forecast).to eq("Stormy").or eq "Clear"
  end

end
