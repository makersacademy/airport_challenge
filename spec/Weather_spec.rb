require 'Weather'
describe Weather do
  it "Says you can't land or take off if weather is stormy" do
    allow(subject).to receive(:rand).and_return(5)
    expect(subject.weather_report).to eq 'Stormy weather, airport closed.'
  end
end
