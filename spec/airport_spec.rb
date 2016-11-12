require 'airport'

describe Airport do

  it "gets a plane" do
    expect(subject.get_plane).to be_kind_of Plane
  end

  it 'responds to .plane' do
    expect(subject).to respond_to :plane
  end

  it 'lands a Plane and can return the same Plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

  it 'can take off a plane' do
    sunny_weather = double("Weather")
    allow(sunny_weather).to receive(:condition) { :sunny }
    subject.set_weather(sunny_weather)
    plane = Plane.new
    subject.land(plane)
    subject.take_off_plane
    expect(subject.plane).to eq nil
  end

  it 'contains a Weather object' do
    expect(subject.weather).to be_kind_of Weather
  end

  it 'can overwrite the weather it initializes with' do
    airport = Airport.new
    weather = Weather.new
    airport.set_weather(weather)
    expect(airport.weather).to eq weather
  end

  describe "error handling" do

    context 'stormy weather' do

      before(:each) do
        @stormy_weather = double("Weather")
        allow(@stormy_weather).to receive(:condition) { :stormy }
        subject.set_weather(@stormy_weather)
      end

    it 'does not allow Planes to take off if the weather is stormy' do
      message = 'Planes cannot take off while it is stormy'
      expect { subject.take_off_plane }.to raise_error(RuntimeError, message)
    end

    it 'does not allow Planes to land if the weather is stormy' do
      message = 'Planes cannot land while it is stormy'
      expect { subject.land(Plane.new) }.to raise_error(RuntimeError, message)
    end

  end

  end

end
