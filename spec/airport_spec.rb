require 'airport'
require 'weather'




describe Airport do

  before(:each) do
  weather = double
  allow(weather).to receive_messages(:check => "sunny")
  end

  it 'instructs a plane to land' do
    expect(subject.plane_land).to eq "Please land your plane."
  end

  it 'instructs a plane to take off' do
    expect(subject.plane_take_off).to eq "Please take off."
  end

  it 'checks if airport has a plane' do
    subject.plane_land

    expect(subject.plane?).to eq true
  end

  it 'responds to check_weather' do
    expect(subject).to respond_to :check_weather
  end

  it 'expect check_weather to return sunny' do
    expect(subject.check_weather).to eq "stormy"
  end

begin
  it 'should return "Weather stormy, do not land." when Weather.new.check == "stormy"' do
    expect(subject.plane_land).to eq "Weather stormy, do not land."
  end
end

end
