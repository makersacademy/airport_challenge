require 'weather'

describe Weather do

  it "responds to forecast" do
    expect(subject).to respond_to :forecast
  end

  it 'lets you know if its stormy or clear' do
    expect(["It's stormy!", "It's clear!"]).to include(subject.forecast)
  end

  it 'if weather_tendancy is 100 it will be stormy' do
    a = Weather.new(100)
    expect(a.forecast).to eq "It's stormy!"
  end

  it 'if weather_tendancy is 0 it will be clear' do
    a = Weather.new(0)
    expect(a.forecast).to eq "It's clear!"
  end 
end
