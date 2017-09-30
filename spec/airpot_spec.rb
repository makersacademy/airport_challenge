require 'airport'

class Plane
end

describe Airport do

  it 'allows a plane to land at airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq(plane)
  end

    # it 'responds to the method take_off' do
      # expect(subject).to respond_to :take_off
    # end

    it 'when take_off method is called it returns an instance of Plane class' do
      subject.land(Plane.new)
      expect(subject.take_off). to be_an_instance_of(Plane)
    end

    # it 'raises an error when you to run take_off method when no planes present' do
      # expect {subject.take_off}.to raise_error 'All planes have gone'
    # end


end
