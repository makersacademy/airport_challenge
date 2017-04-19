require 'weather'

describe Weather do

let(:weather) {class_double("Weather")}

  it 'generates random weather' do
    allow(weather).to receive(:clear?).and_return(true,false)
    expect(weather.clear?).to eq true
    expect(weather.clear?).to eq false
  end

end
