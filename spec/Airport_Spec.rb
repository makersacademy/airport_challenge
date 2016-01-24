require 'Airport.rb'

describe Airport do

it { is_expected.to respond_to(:land).with(1).argument }
it { is_expected.to respond_to :planes_landed }
it { is_expected.to respond_to(:takeoff).with(1).argument}
it { is_expected.to respond_to(:current_weather)}

let(:plane){double :plane}
let(:plane2){double :plane2}

it 'lands a plane' do
  plane = double(:plane)
  airport = Airport.new
  allow(airport).to receive(:current_weather).and_return(false)
  expect(airport.land(plane)).to eq [plane]
end

it 'cannot land a plane more than once' do
  plane = double(:plane)
  airport = Airport.new
  allow(airport).to receive(:current_weather).and_return(false)
  airport.land(plane)
  expect {airport.land(plane)}.to raise_error ("this plane has already landed")
end


it "shows plane has landed" do
  plane = double(:plane)
  airport = Airport.new
  allow(airport).to receive(:current_weather).and_return(false)
  airport.land(plane)
  expect(airport.planes_landed).to eq [(plane)]
  end

=begin
it 'lets a plane takeoff' do
  plane = double(:plane)
  subject.land(plane)
  expect(subject.takeoff(plane)).to eq [plane]
end
=end

it 'lets a specified plane takeoff' do
  plane = double(:plane)
  plane2 = double(:plane2)
  airport = Airport.new
  allow(airport).to receive(:current_weather).and_return(false)
  airport.land(plane)
  airport.land(plane2)
  expect(airport.takeoff(plane)).to eq [plane]
end


it 'makes sure you cannot tell a plane to takeoff more than once' do
  plane = double(:plane)
  airport = Airport.new
  allow(airport).to receive(:current_weather).and_return(false)
  airport.land(plane)
  airport.takeoff(plane)
  expect {airport.takeoff(plane)}.to raise_error ("this plane has already taken off")
end

it 'prevents takeoff when weather is stormy' do
  plane = double (:plane)
  airport = Airport.new
  allow(airport).to receive(:current_weather).and_return(false)
  airport.land(plane)
  allow(airport).to receive(:current_weather).and_return(true)
  expect {airport.takeoff(plane)}.to raise_error ("plane cannot take off due to stormy weather")
end

it 'prevents landing when weather is stormy' do
   plane = double (:plane)
   airport = Airport.new
   allow(airport).to receive(:current_weather).and_return(true)
   expect {airport.land(plane)}.to raise_error ("plane cannot land due to stormy conditions")
 end

end
