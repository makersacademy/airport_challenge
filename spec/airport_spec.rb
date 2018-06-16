require 'airport'

describe Airport do

  it { should respond_to(:land).with(1).argument }

  describe '#land' do

    it "should land a plane" do
      plane = "plane"
      expect(subject.land(plane)).to eq "plane"
    end

  end

end
