require 'weather'

describe Weather  do
  let(:possible_weathers) {proc {|wea| wea == :stormy || wea == :sunny}}

  describe 'current weather access:' do

    it 'can show the current weather' do
      expect(subject.current_weather).to satisfy {possible_weathers}
    end

  end

  describe 'weather changing:' do

    it 'calls the random generator for new weather' do
      expect(subject).to receive :roll_new_weather
      subject.change_weather
    end

    it 'can change the weather to a valid random value' do
      subject.change_weather
      expect(subject.current_weather).to satisfy {possible_weathers}
    end

    it 'can change the weather to a given value' do
      subject.change_weather :dummy_condition
      expect(subject.current_weather).to eq :dummy_condition
    end

  end

end
