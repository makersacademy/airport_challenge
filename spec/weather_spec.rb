require 'weather'

describe Weather do

  it 'responds to stormy weather' do
    expect(subject).to respond_to :stormy?
  end

  it "should return true or false" do
      weather = Weather.new
      weather = weather.stormy?
      expect([true, false].include? weather).to eq true
  end



end
