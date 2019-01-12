require './lib/airport.rb'

describe Airport do

it {is_expected.to respond_to :land}

  it "lands a plane" do
    plane = Plane.new
    weather = Weather.new
    expect(weather).to receive(:stormy?).and_return(false)
    expect(subject.land(plane, weather)).to eq [plane]
  end

it {is_expected.to respond_to :take_off}

  it "Plane takes off" do
  plane = Plane.new
  weather = Weather.new
  expect(weather).to receive(:stormy?).and_return(false)
  subject.land(plane, weather)
  expect(weather).to receive(:stormy?).and_return(false)
  expect(subject.take_off(plane, weather)).to be_a Plane
end

 it "checks plane has taken off" do
   airport = Airport.new
   plane = Plane.new
   weather = Weather.new
   expect(weather).to receive(:stormy?).and_return(false)
   airport.land(plane, weather)
   expect(weather).to receive(:stormy?).and_return(false)
   airport.take_off(plane, weather)
   expect(airport.taken_off?(plane)).to eq true
 end

 it 'raise error when trying to take off due to storm' do
   airport = Airport.new
   plane = Plane.new
   weather = Weather.new
   expect(weather).to receive(:stormy?).and_return(false)
   airport.land(plane, weather)
   expect(weather).to receive(:stormy?).and_return(true)
   expect { airport.take_off(plane, weather) }.to raise_error 'Turbulent weather cannot takeoff'
 end

 it 'raise error when trying to land due to storm' do
   airport = Airport.new
   plane = Plane.new
   weather = Weather.new
   expect(weather).to receive(:stormy?).and_return(true)
   expect { airport.land(plane, weather) }.to raise_error 'Turbulent weather cannot land'
 end

 it 'raise error when airport is full' do
   airport = Airport.new
   weather = Weather.new
   20.times do
     expect(weather).to receive(:stormy?).and_return(false)
     airport.land(Plane.new, weather)
   end
   expect(weather).to receive(:stormy?).and_return(false)
   expect { airport.land(Plane.new, weather)}.to raise_error 'Airport full cannot land'
 end
end
