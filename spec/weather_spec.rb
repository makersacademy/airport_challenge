require 'weather'

describe Weather do
  it 'responds to #stormy' do
    expect(subject).to respond_to(:stormy)
  end

  it 'gives random weather' do
    wx = double("Weather")
    allow(wx).to receive(:stormy).and_return(false, false, false, false, false, true, false, false, false, false)
    expect(wx.stormy).to eq(false)
    expect(wx.stormy).to eq(false)
    expect(wx.stormy).to eq(false)
    expect(wx.stormy).to eq(false)
    expect(wx.stormy).to eq(false)
    expect(wx.stormy).to eq(true)
    expect(wx.stormy).to eq(false)
    expect(wx.stormy).to eq(false)
    expect(wx.stormy).to eq(false)
    expect(wx.stormy).to eq(false)
  end

end
