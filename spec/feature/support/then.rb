def then_the_plane_can_land
  airport_code = @airport.code
  plane_id = @plane.id
  @atc.clear_for_landing(airport_code, plane_id)
  expected = "Successful landing of #{plane_id} at #{airport_code}"
  expect(@atc.land(airport_code, plane_id)).to eq expected
  expect(@airport.plane_count).to eq 1
  expect(@plane.status).to eq airport_code
end