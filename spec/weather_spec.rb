require 'weather'

describe Weather do
  it 'can create an instance of weather' do
    weather = Weather.new
    expect(weather).to be_kind_of(Weather)
  end


  describe "stormy?" do
    it 'specifies if the weather is stormy or clear' do
      generator = Weather.new

      allow(generator).to receive(:sample).and_return(1)

      expect(generator.stormy?).to eq(true)
    end
  end
end
