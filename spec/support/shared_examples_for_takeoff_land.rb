require './lib/takeoff_land.rb'

shared_examples_for TakeoffLand do
  let(:weather) {double("weather", :stormy? => false)}
  let(:flyer_lander) {double(:flyer_lander)}

  describe '#taking_off' do

    it 'returns what has taken off' do
      expect(subject.taking_off(flyer_lander, weather)).to eq(flyer_lander)
    end
  end

  describe '#landing' do

    it 'returns what has landed' do
      expect(subject.landing(flyer_lander, weather)).to eq(flyer_lander)
    end

  end

  context 'stormy_weather' do
    before {allow(weather).to receive(:stormy?).and_return(true)}

    it 'does not allow taking off when the weather is stormy' do
      message = 'Too stormy to takeoff!'
      expect{subject.taking_off(flyer_lander, weather)}.to raise_error(message)
    end

    it 'does not allow landing when the weather is stormy' do
      message = 'Too stormy to land!'
      expect{subject.landing(flyer_lander, weather)}.to raise_error(message)
    end
  end


end
