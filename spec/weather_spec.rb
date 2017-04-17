require 'weather'

  describe Weather do

    subject(:weather) { described_class.new }

    it 'allows setting different weather types' do
        allow(weather).to receive(:stormy?).and_return(true, false)
        expect(weather.stormy?).to eq(true)
        expect(weather.stormy?).to eq(false)
    end

end
