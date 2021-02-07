require "./air_traffic_controller"
require './weather'
describe SafetyProtocol do

  default_capacity = 10
  less_than_default_capacity = 2
  more_than_default_capacity = 15


  describe '#weather_check' do
    it 'informs when weather is safe' do
      safety = SafetyProtocol.new(default_capacity)
      expect(safety.weather_check('sunny')).to eq 'Weather check: safe'
    end

    it 'raises an error is its stormy' do
      safety = SafetyProtocol.new(default_capacity)
      expect { safety.weather_check('stormy') }.to raise_error 'Too stormy to land safely'
    end
  end
  describe '#capacity_check' do
    it 'informs when capacity is at safe level' do
      safety = SafetyProtocol.new(default_capacity)
      expect(safety.capacity_check(less_than_default_capacity)).to eq 'Airport capacity level check: safe'
    end

    it 'raises an error when capacity level is unsafe' do
      safety = SafetyProtocol.new(default_capacity)
      expect { safety.capacity_check(more_than_default_capacity) }.to raise_error 'Airport too full to land safely'
    end
  end

  describe '#is_landing_safe?' do
    it 'returns true if landing is safe' do
      safety = SafetyProtocol.new(default_capacity)
      expect(safety.is_landing_safe?(less_than_default_capacity, 'sunny')).to eq true
    end

    it 'raises an error when weather is unsafe' do
      safety = SafetyProtocol.new(default_capacity)
      expect { safety.is_landing_safe?(less_than_default_capacity, 'stormy') }.to raise_error 'Too stormy to land safely'
    end

    it 'raises an error when capacity level is unsafe' do
      safety = SafetyProtocol.new(default_capacity)
      expect { safety.is_landing_safe?(more_than_default_capacity, 'sunny') }.to raise_error 'Airport too full to land safely'
    end
  end

  describe '#is_take_off_safe?' do
    it 'returns true if take off is safe' do
      safety = SafetyProtocol.new(default_capacity)
      expect(safety.is_take_off_safe?('sunny')).to eq true
    end

    it 'raises an error when weather is unsafe' do
      safety = SafetyProtocol.new(default_capacity)
      expect { safety.is_take_off_safe?('stormy') }.to raise_error 'Too stormy to land safely'
    end
  end
end
