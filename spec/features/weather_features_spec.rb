require 'weather'

describe Weather do

  class DummyClass < Weather; end
  let(:obj) { DummyClass.new }

  it 'tells whether there is .bad_weather?' do
    states = [true, false]
    expect(states).to include obj.bad_weather?
  end

  it 'sometimes has bad weather and sometimes good' do
    trues = []
    falses = []
    100.times do
      weather = obj.bad_weather?
      if weather
        trues.push(weather)
      else
        falses.push(weather)
      end
    end
    expect(trues.count).not_to eq 0
    expect(falses.count).not_to eq 0
  end

end
