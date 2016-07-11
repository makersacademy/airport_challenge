require 'weather'

describe Weather do

  #look into Kernal and stub on that

  let(:weather) {class_double("Weather")}

  it 'reports either true or false to #stormy?' do
    allow(weather).to receive(:stormy?).and_return(false,true,true,false)
    expect(weather.stormy?).to eq false
    expect(weather.stormy?).to eq true
    expect(weather.stormy?).to eq true
    expect(weather.stormy?).to eq false
    expect(weather.stormy?).to eq false
  end

end
