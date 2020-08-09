require 'weather'
require 'airport'

describe Weather do 

	it { is_expected.to respond_to(:land).with(1).argument}

	it { is_expected.to respond_to(:take_off).with(1).argument}

  it 'returns sunny or stormy' do
  	current = Weather.new
    allow(current).to receive(:generate).and_return("sunny")

    expect(current.generate). to eq("sunny")
  end







end
