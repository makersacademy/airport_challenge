require './lib/airport.rb'
require './lib/weather.rb'
require './lib/plane.rb'

describe Airport do

  include Weather

  let(:airport) {Airport.new}
  let(:plane) {double :plane}


  context 'at instantiation' do

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'has a variable capacity' do
      variable_capacity = 20
      airport = Airport.new(variable_capacity)
      variable_capacity.times {airport.land(plane)}
      expect {airport.land(plane)}.to raise_error "This airport is full"
    end
   end

   context 'landing a plane and releasing a plane' do

     it 'raises an error if a plane tries to take off when the weather is #stormy' do
       subject.land(plane)
       allow(subject).to receive(:conditions) { :stormy }
       expect {subject.release(plane)}.to raise_error "It is too stormy to fly"
     end

   end

end
