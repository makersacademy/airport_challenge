require 'airport'

describe Airport do

  let(:plane) { double :plane }
  let(:stormy_weather) { double(:condition => "stormy") }
  let(:clear_weather) { double(:condition => "clear") }

  it 'can add a plane to an array of planes in the airport by calling the "land_plane" method' do
    subject.sky.add_plane(plane)
    expect(subject.land_plane(plane, clear_weather).planes).to eq [plane]
  end

  it 'removes a plane from the airport when the "take_off_plane" method is called' do
    subject.sky.add_plane(plane)
    airport = subject.land_plane(plane, clear_weather)
    expect(airport.take_off_plane(plane, clear_weather).planes.include?(plane)).to eq false
  end

  it "won't allow a plane to take off if the weather is stormy" do
    subject.sky.add_plane(plane)
    airport = subject.land_plane(plane, clear_weather)
    expect { airport.take_off_plane(plane, stormy_weather) }.to raise_error "can't do that due to storms"
  end

  it "won't allow a plane to land if the weather is stormy" do
    subject.sky.add_plane(plane)
    expect { subject.land_plane(plane, stormy_weather) }.to raise_error "can't do that due to storms"
  end

  it "won't allow a plane to land if the airport is full" do
    (subject.capacity + 1).times { subject.sky.add_plane(plane) }
    p subject
    expect { subject.capacity.times { subject.land_plane(plane, clear_weather) } }.to_not raise_error
    expect { subject.land_plane(plane, clear_weather) }.to raise_error "can't land as airport is full"
  end

  it "allows a user to amend the default airport capacity when initializing a new airport" do
    airport = Airport.new(20)
    expect(airport.capacity).to eq 20
  end

  it "only allows planes that are already flying in the sky to land in the airport" do
    subject.sky.add_plane(plane)
    expect { subject.land_plane("plane_2", clear_weather) }.to raise_error "this plane isn't in the sky"
  end

  it "only allows planes that are in the airport to take off" do
    subject.sky.add_plane(plane)
    subject.land_plane(plane, clear_weather)
    expect { subject.take_off_plane("plane_2", clear_weather) }.to raise_error "this plane isn't in the airport"
  end

end
