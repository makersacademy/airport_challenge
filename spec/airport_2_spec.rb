describe Airport do

 let(:plane) { double :plane }
 let(:plane) { double :plane, flying?: true}
 let (:airport) { Airport.new }

 describe 'take off' do
   # take off test
   # it { is_expected.to respond_to(:take_off) }

   # releases a plane
   it { is_expected.to respond_to(:release_plane) }

   it "raises error when there are no planes available" do
     expect(subject.release_plane).to eq(false)
   end
 end

 describe 'landing' do
   it 'instructs a plane to land' do
     expect(plane).to be_flying
   end
 end

 describe 'traffic control' do
   context 'when airport is full' do
     it { is_expected.to respond_to(:dock).with(1).argument }

     it "has a default capacity" do
       expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
     end

     it "raises an error when airport is full" do
       subject.capacity.times { subject.dock plane }
       expect { subject.dock plane }.to raise_error 'Airport unavailable'
     end
   end

   # Include a weather condition.
   # The weather must be random and only have two states "sunny" or "stormy".
   # Try and take off a plane, but if the weather is stormy,
   # the plane can not take off and must remain in the airport.
   #
   # This will require stubbing to stop the random return of the weather.
   # If the airport has a weather condition of stormy,
   # the plane can not land, and must not be in the airport

   context 'when weather conditions are stormy' do
     it 'does not allow a plane to take off' do
       allow(airport).to receive(:stormy?).and_return(true)
       expect(airport.release_plane).to eq(false)
     end

     it 'does not allow a plane to land' do
       allow(airport).to receive(:stormy?).and_return(true)
       expect{ subject.dock plane }.to raise_error 'Airport unavailable'
     end
   end
 end
end