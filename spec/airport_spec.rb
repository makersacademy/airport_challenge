require './lib/airport.rb'
require './lib/weather.rb'
require './lib/plane.rb'

describe Airport do

  include Weather

  let(:plane) {double :plane}


  context 'at instantiation' do

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY end

    it "raises an error if try to land a plane when airport is full" do
      allow(subject).to receive(:stormy?) {false}
      plane = double('plane', flying: true)
      Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error "This airport is full"
    end


   end

   context 'landing a plane and releasing a plane' do

     it 'removes the plane from the airport when it releases the plane' do
       plane = double('plane', flying: false)
       subject.release(plane)
       expect(subject.planes).not_to include plane
    end

     it 'raises an error if a plane tries to take off when the weather is #stormy' do
       plane = double('plane', flying: false)
       allow(subject).to receive(:stormy?) { true }
       expect {subject.release(plane)}.to raise_error "It is too stormy to fly"
     end

     it 'raises an error if a plane tries to land when the weather is #stormy' do
       plane = double('plane', flying: true)
       allow(subject).to receive(:stormy?) { true }
       expect {subject.land(plane)}.to raise_error "It is too stormy to land"
     end

     it 'cannot #release a plane that is already flying' do
       plane = double('plane', flying: true)
       expect {subject.release(plane)}.to raise_error "This plane is already flying"
     end

     it 'cannot #land a plane that is already landed' do
       plane = double('plane', flying: false)
       expect {subject.land(plane)}.to raise_error "This plane has already landed"
     end
   end

end
