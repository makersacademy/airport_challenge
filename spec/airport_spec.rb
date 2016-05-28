require 'airport'

describe Airport do
let(:plane) {double(:plane)}

  describe '::new' do
    it {should be_instance_of(Airport)}

    it 'should set capacity if specified' do
    airport = Airport.new(1)
    allow(subject).to receive(:is_stormy?).exactly(2).times.and_return(false)
    airport.instruct_plane_to_land(plane)
    expect{airport.instruct_plane_to_land(plane)}.to raise_error("Cannot land - airport is full")
    end
  end

  describe '#instruct_plane_to_land' do

    it {should respond_to(:instruct_plane_to_land).with (1)}

    it 'should land a plane when not stormy & airport not full' do
    allow(subject).to receive(:is_stormy?).and_return(false)
    subject.instruct_plane_to_land(plane)
    expect(subject.planes).to eq [plane]
  end

    it 'should not land a plane if it is stormy' do
      allow(subject).to receive(:is_stormy?).and_return(true)
      expect{subject.instruct_plane_to_land(plane)}.to raise_error("Too stormy to land")
    end

    it 'should not let a plane land if the airport is full' do
    allow(subject).to receive(:is_stormy?).exactly(20).times.and_return(false)
    20.times {subject.instruct_plane_to_land(plane)}
    expect{subject.instruct_plane_to_land(plane)}.to raise_error("Cannot land - airport is full")
    end

  end

  describe '#instruct_plane_to_take_off' do

    it {should respond_to(:instruct_plane_to_take_off).with (1)}

    it 'should make a plane take off' do
      allow(subject).to receive(:is_stormy?).exactly(2).times.and_return(false)
      subject.instruct_plane_to_land(plane)
      subject.instruct_plane_to_take_off(plane)
      expect(subject.planes).to eq []
    end

    it 'should only make 1 plane take off' do
      allow(subject).to receive(:is_stormy?).exactly(3).times.and_return(false)
      2.times {subject.instruct_plane_to_land(plane)}
      subject.instruct_plane_to_take_off(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'should not let a plane take off if it is stormy' do
      allow(subject).to receive(:is_stormy?).and_return(false)
      subject.instruct_plane_to_land(plane)
      allow(subject).to receive(:is_stormy?).and_return(true)
      expect{subject.instruct_plane_to_take_off(plane)}.to raise_error("Too stormy to take off")
    end
  end

end