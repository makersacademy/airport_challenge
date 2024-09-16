Airport Challenge

Started by identifying objects and messages, and determining how they would interact with one another:

Objects

air traffic controller	
plane			 -----> land
plane			 -----> take_off_plane
airport		 ----->

Messages

land (instruct plane to land)
take off plane

Airport <---- land ----> Plane
Airport <---- take_off_plane ---> Plane

Have not fully developed the test that raises an error if the airport is full:

  describe '#land' do
     it 'raises an error when airport is full' do
       plane = Plane.new
       expect { subject.land(plane) }.to raise_error 'Airport full'
     end
     ...
  end

I could've also written the unit test for the take_off_plane method in a similar style as the land method which takes plane as an argument.

