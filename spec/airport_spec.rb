require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane, :status => "unassigned") }

  it { is_expected.to respond_to(:planes) }
  it { is_expected.to respond_to(:weather?) }
  it { is_expected.to respond_to(:weather) }
  it { is_expected.to respond_to(:weather_fetcher) }

  it "should contain no planes when new" do
    expect(airport.planes).to eq []
  end

  describe '#weather?' do
    it 'should return true or false' do
      expect(airport.weather?).to eq true || false
    end

  end

  describe '#weather_fetcher' do
    it 'should update weather attribute of Airport' do
      expect(airport.weather_fetcher).to eq airport.weather
    end
  end


end
