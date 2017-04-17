require "airport"
require "airplane"

describe Airport do

  subject(:airport) {described_class.new("luton")}

  let(:airplane) {double :airplane}

  describe 'instances of airport' do
    it "can create instance of airport" do
      expect(subject.name).to start_with("l") & end_with("n")
    end

    it "name can be set as argument" do
      expect(subject.name).to eq "luton"
    end
  end

  describe 'capacity' do
    it "can set capacity when set_capacity is called" do
      expect(subject.assign_capacity(100)).to eq(100)
    end
  end

  describe 'land/takeoff' do
    it "plane can land" do
      allow(subject).to receive(:stormy?) {false}
      allow(subject).to receive(:security_threat?) {false}
      allow(subject).to receive(:tell_to_land).and_return(airplane)
      allow(subject).to receive(:planes_at_airport).and_return(airplane)
      expect(subject.planes_at_airport).to eq (airplane)
    end

    it "plane can take off" do
      subject.tell_to_take_off(airplane)
      expect(subject.planes_at_airport).to eq []
    end
  end

  describe 'tell to land when full' do
    it "cant land when full is true" do
      allow(subject).to receive (:full?) {true}
      message = "luton is full/dangerous or its too stormy, no land bro"
      expect(subject.tell_to_land(airplane)).to eq message

    end

    it 'is full when cap reached' do
      20.times{subject.tell_to_land(Airplane.new)}
      message = "luton is full/dangerous or its too stormy, no land bro"
      expect(subject.tell_to_land(airplane)).to eq message
    end
  end

  describe 'stormy issues' do
    it 'does not allow plane to take off in stormy weather' do
      allow(subject).to receive(:stormy?) {true}
      subject.tell_to_land(airplane)
      expect(subject.tell_to_take_off(airplane)).to eq "too stormy to fly bro"
    end

    it 'doesn\'t allow plane to land in stormz' do
      allow(subject).to receive(:stormy?) {true}
      mes = "#{subject.name} is full/dangerous or its too stormy, no land bro"
      expect(subject.tell_to_land(airplane)).to eq mes
    end
  end
end



# test each method, and change of state in object
