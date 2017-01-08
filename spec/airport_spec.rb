require 'airport'

describe Airport do

 subject(:airport) {described_class.new}

  context 'when landing planes' do
    it {is_expected.to respond_to(:land).with(1).argument}
    it "raises an error if user tries to land a plane that is already landed"  do
    expect  {subject.land Plane.new}.to raise_error "The plane is already in airport"
    end
end
  context 'when sending planes' do
    it {is_expected.to respond_to(:send).with(1).argument}
  end
end
