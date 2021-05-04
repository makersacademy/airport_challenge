require 'weather'

describe Weather do 
  it 'randomly selects a number' do
    expect(subject.random_number).to be_kind_of Integer
  end

  it "randomly selects weather" do 
    allow(subject).to receive(:random_number) { 5 }
    expect(subject.weather_forecast).to eq('stormy')
  end
end
