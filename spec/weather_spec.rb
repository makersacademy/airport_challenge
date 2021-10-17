describe Weather do 
  it 'should check for weather condition' do 
    weather = Weather.new
    expect(weather.Weather_condition).to be_truthy
  end 
end 