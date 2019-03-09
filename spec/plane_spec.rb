require 'plane'

describe Plane do
  it { is_expected.to be_a_kind_of(Plane) }

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'sets default location to flying' do
    plane = Plane.new
    expect(plane.location).to eq "Flying"
  end


  describe '#update_satnav' do
    it 'updates the options for airports to land at' do
      plane = Plane.new
      heathrow = Airport.new("Heathrow")
      expect(plane.update_satnav(heathrow)).to eq ["Flying","Heathrow"]
    end
    it 'tells the pilot that the satnav is up to date' do
      plane = Plane.new
      heathrow = Airport.new("Heathrow")
      plane.update_satnav(heathrow)
      expect{ plane.update_satnav(heathrow) }.to output("Satnav is up to date\n").to_stdout
    end
  end

  describe '#land' do
    it 'lands a plane at the specified airport' do
      plane = Plane.new
      heathrow = Airport.new("Heathrow")
      plane.update_satnav(heathrow)
      plane.land(heathrow)
      expect(plane).to have_attributes(:location => "Heathrow")
    end
  end
end
