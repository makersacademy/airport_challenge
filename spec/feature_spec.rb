require 'plane'

feature Plane do
  let(:sunny_weather) { instance_double("Weather", :sunny? => true) }
  
  scenario "User creates a new plane" do
    expect(subject).to be_flying
  end

  scenario 'user lands plane at an airport' do
    airport = Airport.new({ weather: sunny_weather })
    subject.land(airport)
    expect(subject.flying?).to eq false
    
  end
  
  scenario 'user takes off from an airport' do
    airport = Airport.new({ weather: sunny_weather })
    subject.land(airport)
    subject.takeoff(airport)
    expect(subject.flying?).to eq true
  end
end

feature Airport do
  let(:sunny_weather) { instance_double("Weather", :sunny? => true) }
  let(:stormy_weather) { instance_double("Weather", :sunny? => false) }

  scenario 'User creates a new airport' do
    subject = Airport.new({ weather: sunny_weather })
    expect(subject).to be_a(Airport)
  end

  scenario 'user creates a new airport with a specified capacity' do
    plane = Plane.new
    plane2 = Plane.new
    subject = Airport.new({ weather: sunny_weather, capacity: 1 })
    plane.land(subject)
    expect { plane2.land(subject) }.to raise_error(RuntimeError, "Airport Full")
  end

  scenario 'stormy weather prevents planes landing' do
    subject = Airport.new({ weather: stormy_weather })
    plane = Plane.new
    expect { plane.land(subject) }.to raise_error(RuntimeError, "Not safe for landing")
  end

  scenario 'stormy weather prevents planes taking off' do
    plane = double('Plane')
    subject = Airport.new({ weather: stormy_weather })
    subject.instance_eval { move_to_hangar(plane) }
    expect { subject.request_takeoff(plane) }.to raise_error(RuntimeError, "Not safe for takeoff")
  end

  scenario 'full hangar prevents planes landing' do
    plane = Plane.new
    subject = Airport.new({ weather: sunny_weather, capacity: 0 })
    expect { plane.land(subject) }.to raise_error(RuntimeError, "Airport Full")
  end
end

feature Weather do
  scenario 'User creates a new weather system' do
    expect([true, false]).to include(subject.sunny?)
  end
end
