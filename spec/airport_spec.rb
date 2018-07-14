require './lib/airport'

describe Airport do
#I want to prevent landing when weather is stormy
  it 'prevents landing in stormy weather' do
      @plane = Plane.new
    if subject.weather == 'stormy'
      expect(subject.land).to eq ("Stormy weather: No plane must land.")
    end
  end
end
