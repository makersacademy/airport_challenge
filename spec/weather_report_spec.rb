require 'weather_report'

describe WEATHER_REPORT do
   it 'today we anticipate stormy weather' do
     expect(subject.stormy).to eq true
   end

   it 'today we anticipate clear weather' do
     expect(subject.clear).to eq true
   end
end
