
 require 'weather'

 describe Weather do
   subject(:weather) { Weather.new }

   it 'has a default of not stormy' do
     expect(weather.stormy?).to eq false
   end

   it 'can update for stormy conditions' do
     weather.incoming_storm
     expect(weather.stormy?).to eq true
   end
end
