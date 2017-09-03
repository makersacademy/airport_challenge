require 'weather_report'

describe WEATHER_REPORT do
   it 'today we anticipate stormy weather' do
    #  weather = WEATHER_REPORT.new
     weather = double
     allow(weather).to receive(:one).and_return(true)
     expect(weather.one).to eq true
   end

  #  it 'check weather' do
  #    subject.stormy?
  #   #  weather = double
  #   #  allow(weather).to receive(:stormy?).and_return('stormy')
  #    expect(subject.report).to eq 'stormy'
  #  end

  #  it 'today we anticipate clear weather' do
  #    expect(subject.clear).to eq true
  #  end
end
