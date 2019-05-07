require 'weather'

describe Weather do
  weather = Weather.new

  it "gives a status of stormy or sunny" do
    expect(weather.status?).to eq('stormy').or eq('sunny')
  end
end
