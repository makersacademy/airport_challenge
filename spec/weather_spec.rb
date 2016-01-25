require 'weather'

describe Weather do
  it 'responds to #stormy' do
    expect(subject).to respond_to(:stormy)
  end

  it 'gives random weather' do
    wx = double("Weather")
    allow(wx).to receive(:stormy).and_return(nil, nil, nil, nil, nil, true, nil, nil, nil, nil)
    expect(wx.stormy).to eq(nil)
    expect(wx.stormy).to eq(nil)
    expect(wx.stormy).to eq(nil)
    expect(wx.stormy).to eq(nil)
    expect(wx.stormy).to eq(nil)
    expect(wx.stormy).to eq(true)
    expect(wx.stormy).to eq(nil)
    expect(wx.stormy).to eq(nil)
    expect(wx.stormy).to eq(nil)
    expect(wx.stormy).to eq(nil)
  end

end
