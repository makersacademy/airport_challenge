require 'weather_report'

describe WEATHER_REPORT do
   it 'TODAY WE ANTICIPATE STORMY WEATHER' do

   weather = double
   allow(weather).to receive(:report).and_return('stormy')
   expect(weather.report).to eq 'stormy'
 end

end
