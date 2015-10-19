# # Given 10 planes, each plane must land.
# # When weather conditions are stormy, pilot should try again later.
# # All planes are landed when they have status :landed
# # After all planes have landed, they should all take off again.
# # All planes have taken off when they have status :flying

feature 'mega busy airport' do
  scenario 'all planes can land and all planes can take off' do
    airport = Airport.new
    planes = Array.new(10, Plane.new)

    until planes.sort == airport.planes.sort
      planes.each do |plane|
        begin
          airport.clear_for_landing plane
        rescue
          break
        end
      end
    end

    planes.each { |plane| expect(plane.status).to eq :landed }

    until airport.planes.empty?
      planes.each do |plane|
        begin
          airport.clear_for_takeoff plane
        rescue
          break
        end
      end
    end

    planes.each { |plane| expect(plane.status).to eq :flying }
  end
end
