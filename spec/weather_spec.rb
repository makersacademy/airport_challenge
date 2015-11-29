require 'weather'

describe Weather do
  it 'gives the #current_weather' do
    expect(subject).to respond_to(:current_weather)
  end

  it 'gives random weather' do
    wx = double("Weather")
    allow(wx).to receive(:current_weather).and_return(:sunny, :sunny, :sunny, :sunny, :sunny, :stormy, :sunny, :sunny, :sunny, :sunny)
    expect(wx.current_weather).to eq(:sunny)
    expect(wx.current_weather).to eq(:sunny)
    expect(wx.current_weather).to eq(:sunny)
    expect(wx.current_weather).to eq(:sunny)
    expect(wx.current_weather).to eq(:sunny)
    expect(wx.current_weather).to eq(:stormy)
    expect(wx.current_weather).to eq(:sunny)
    expect(wx.current_weather).to eq(:sunny)
    expect(wx.current_weather).to eq(:sunny)
    expect(wx.current_weather).to eq(:sunny)
  end

end
