require "./lib/weather"
describe Weather do
  it "sets weather_report to stormy when weather >= 10" do
    allow_any_instance_of(Weather).to receive(:rand).and_return(10)
    expect(Weather.new.stormy).to eq "stormy"
  end

  it "sets weather_report to clear when weather <= 9" do
    allow_any_instance_of(Weather).to receive(:rand).and_return(9)
    expect(Weather.new.stormy).to eq "clear"
  end
end
