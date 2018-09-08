require 'plane'

describe Plane do
  it { is_expected.to respond_to(:name) }  
  describe "@name" do
    it 'assigns default value to @name' do
      expect(subject.name).to eq("Plane")
    end

    it 'assigns initialised parameter as @name' do
      subject = Plane.new("Boeing 74")  
      expect(subject.name).to eq("Boeing 74")
    end
  end
end
