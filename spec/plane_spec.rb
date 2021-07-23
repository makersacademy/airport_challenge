require 'plane'
describe 'creating a plane object' do
      it 'sets a value for the plane identifier, nil for airport and status set to landed' do
        subject = Plane.new
      expect(subject.planeLastAssignednumber).to eq(1)
      expect(subject.lastairport).to eq(nil)
      expect(subject.status).to eq("landed")
    end
end
describe 'returning Plane information' do
  it 'returns the key information for the Plane instance' do
    plane1 = Plane.new
    plane1.planeLastAssignednumber = 5
    plane1.lastairport = "MAN"
    plane1.status = "flying"
    expect(plane1.planeLastAssignednumber).to eq(5)
    expect(plane1.lastairport).to eq("MAN")
    expect(plane1.status).to eq("flying")
end
end

