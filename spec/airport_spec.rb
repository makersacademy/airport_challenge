require 'airport'

describe Airport do

 subject(:airport) {described_class.new}
begin
  context 'when landing planes' do
  #  it {is_expected.to respond_to(:land).with(1).argument}
    it "raises an error if user tries to land a plane with status false "  do
      expect  {subject.land(Plane.new(false))}.to raise_error "The plane is already in airport"
    end
    it 'airport accepts a plane and changes its status to false' do
    plane = Plane.new(true)
    expect(subject.land(plane)).to eq(true)
    expect(plane.status).to eq(false)
    end
  end
end
  context 'when sending planes' do
  #  it {is_expected.to respond_to(:send).with(1).argument}
    it "sends a plane only if it has a false status" do
      expect {subject.send(Plane.new)}.to raise_error "The plane is already flying"
    end
    it 'sends a plane and changes its status to true' do
    expect(subject.land(Plane.new)).to eq(true)
    expect(Plane.new.status).to eq(true)
    end
  end
end
