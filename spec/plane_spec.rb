require 'plane'

describe 'Plane' do

  describe 'attributes' do

    subject { Plane.new }

    it "allows reading and writing for :model_number" do
      subject.model_number = 'Boeing 787-9'
      expect(subject.model_number).to eq('Boeing 787-9')
    end

    it "allows reading and writing for :flight_number" do
      subject.flight_number = 2738
      expect(subject.flight_number).to eq(2738)
    end

  end

end