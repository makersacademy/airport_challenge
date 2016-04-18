require 'weather_checker'

shared_examples_for "a weather checker" do
  let(:wc) {described_class.new}

  describe '#update_weather' do
    it 'it reads the current "updated" weather' do
      wc.update_weather
      expect(wc.weather == "sunny" || wc.weather == "stormy").to eq(true)
    end
  end

end

describe Airport do
  it_behaves_like "a weather checker"
end
