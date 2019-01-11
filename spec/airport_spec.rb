require 'airport'

describe Airport do

  let(:plane) { double :plane }
  let(:stormy_weather) { double(:condition => "stormy") }

  it 'can add a plane to an array of planes in the airport by calling the "land_plane" method' do
    expect(subject.land_plane(plane).planes).to eq [plane]
  end

  it 'removes a plane from the airport when the "take_off_plane" method is called' do
    airport = subject.land_plane(plane)
    expect(airport.take_off_plane(plane).planes.include?(plane)).to eq false
  end

  it "won't allow a plane to take off if the weather is stormy" do
    airport = subject.land_plane(plane)
    expect { airport.take_off_plane(plane, stormy_weather) }.to raise_error "can't take off due to storms"
  end

  it "returns the weather condition when 'check_weather' is called" do
    expect(subject.check_weather(stormy_weather)).to eq "stormy"
  end

end
