require "airport"

describe Airport do

  #it 'accepts planes' do
  #  plane = Plane.new
  #  expect(subject.accept(plane)).to be_instance_of(Plane)
  #end

  it {is_expected.to respond_to(:weather_stormy?)}

  it 'prevents takeoff in stormy weather' do
    allow(subject.deny_takeoff).to receive(:weather_stormy?){1}.and_return ('The weather is stormy, takeoff denied')
  end

  it 'prevents landing in stormy weather' do
    allow(subject.deny_landing).to receive(:weather_stormy?){1}.and_return ('The weather is stormy, landing denied')
  end

end
