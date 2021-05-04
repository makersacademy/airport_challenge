it 'lands a plane at an airport' do 
  # arrange
  airport = airport.new
  plane = plane.new
  # act 
  airport.land(plane)
  # assert
  expect(airport.planes).to eq [plane]
end
end 




raise "ERROR! Airport is full, you cannot land" if full?
  @planes << new_plane 