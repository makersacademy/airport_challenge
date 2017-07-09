feature 'Routine operations' do
  scenario 'Lands and takes-off a number of planes' do
    @airport = create_airport
    @planes = create_planes

    rand(100).times do
      plane = @planes[rand(@planes.count - 1)]

    end
    # randomly choose a plane
    # give it an order
    # rinse & repeat
  end

  private
  def create_airport
    Airport.new
  end

  def create_planes
    Array.new(20, Plane.new)
  end
end
