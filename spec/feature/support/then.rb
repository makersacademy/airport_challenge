def then_the_plane_will_be_at_the_destination_airport
  p 'then_the_plane_will_be_at_the_destination_airport'
  expect(@airport.view_planes_at_terminal).to include @plane.id
end

def then_the_plane_will_no_longer_be_at_the_airport
  p 'then_the_plane_will_no_longer_be_at_the_airport'
  expect(@airport.view_planes_at_terminal).not_to include @plane.id
end

def then_the_plane_will_not_be_able_to_land
  p 'then_the_plane_will_not_land'
  expect(@airport.view_planes_at_terminal).not_to include @plane.id
end

def then_the_plane_will_not_be_able_to_take_off
  p 'then_the_plane_will_not_be_able_to_take_off'
  expect(@airport.view_planes_at_terminal).to include @plane.id
end