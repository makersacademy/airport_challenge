require 'weather'

describe Weather do
  it 'Should have a weather class' do
    expect(subject).to be_instance_of(Weather)
  end

  describe '#weather_check' do
    it 'Should respond to #weather_check' do
      expect(subject).to respond_to(:weather_check)
    end
  end

end
