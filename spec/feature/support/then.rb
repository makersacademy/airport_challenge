def then_the_plane_can_land
  airport_code = @airport.code
  plane_id = @plane.id
  @atc.clear_for_landing(airport_code, plane_id)
  expected = "Successful landing of #{plane_id} at #{airport_code}"
  expect(@atc.land(airport_code, plane_id)).to eq expected
  expect(@airport.plane_count).to eq 1
  expect(@plane.status).to eq airport_code
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