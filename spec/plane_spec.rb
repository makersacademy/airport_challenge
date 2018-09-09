require 'plane'

describe Plane do
  describe "@name" do
    it { is_expected.to respond_to(:name) }  

    it 'assigns default randomised value to @name' do
      subject.instance_eval { @name = "Plane 23" }
      expect(subject.name).to eq("Plane 23")
    end

    it 'assigns initialised parameter as @name' do
      subject = Plane.new("Boeing 74")  
      expect(subject.name).to eq("Boeing 74")
    end
  end
end
