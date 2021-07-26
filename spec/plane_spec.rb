require 'plane'

describe 'creating a plane object' do
      it 'sets a value for the plane identifier, nil for airport and status set to landed' do
      subject = Plane.new
      expect(subject.status).to eq("landed")
      expect(subject.lastlandedairport).to eq(900)
      expect(subject.planeid).to eq(subject.object_id)
    end
end

describe 'returning Plane information' do
  it 'returns the key information for the Plane instance' do
    subject = Plane.new     
    expect(subject.return_plane_info).to eq([subject.lastlandedairport, subject.status])
  end
end

