require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#set_conditions' do
    it 'returns an integer less than 11 to be used to set the weather' do
      expect(subject.get_weather).to be < 11
    end
  end

 # it 'returns a string value for the weather' do
 #   expect(subject.set_conditions).to match 'stormy'
 # end

end
