def then_the_plane_can_land
  airport_code = @airport.code
  plane_id = @plane.id
  @atc.clear_for_landing(airport_code, plane_id)
  expected = "Successful landing of #{plane_id} at #{airport_code}"
  expect(@atc.land(airport_code, plane_id)).to eq expected
  expect(@airport.plane_count).to eq 1
  expect(@plane.status).to eq airport_code
end

def then_the_plane_cannot_land
  airport_code = @airport.code
  airport_name = @airport.airport_name
  plane_id = @plane.id
  plane_name = @plane.name
  expected = "Plane #{plane_id} (#{plane_name}) delayed landing due to bad weather at #{airport_name}"
  
  expect(@atc.clear_for_landing(airport_code, plane_id)).to eq expected
  expect(@airport.plane_count).to eq 0
  expect(@plane.status).to eq Aeroplane::FLYING
end

def then_another_plane_cannot_land(capacity = Airport::DEFAULT_AIRPORT_CAPACITY)
  airport_code = @airport.code
  airport_name = @airport.airport_name
  plane = AeroplaneFactory.build
  @atc.add_plane(plane)
  expected = "Error: This airport is full you cannot land any more planes"
  
  expect(@atc.clear_for_landing(airport_code, plane.id)).to eq expected
  expect(@airport.plane_count).to eq capacity
  expect(plane.status).to eq Aeroplane::FLYING
end

def then_the_plane_can_take_off
  airport_code = @airport.code
  plane_id = @plane.id
  @atc.clear_for_take_off(plane_id)
  expected = "Successful take off of #{plane_id} at #{airport_code}"
  expect(@atc.take_off(airport_code, plane_id)).to eq expected
  expect(@airport.plane_count).to eq 0
  expect(@plane.status).to eq Aeroplane::FLYING
end

def then_the_plane_cannot_take_off
  airport_code = @airport.code
  airport_name = @airport.airport_name
  plane_id = @plane.id
  plane_name = @plane.name
  expected = "Plane #{plane_id} (#{plane_name}) deplayed take-off due to bad weather at #{airport_name}"
  expect(@atc.clear_for_take_off(plane_id)).to eq expected
  expect(@airport.plane_count).to eq 1
  expect(@plane.status).to eq airport_code
end
