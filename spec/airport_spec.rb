require 'airport'

describe Airport do
  let(:plane) { double :plane }

  describe '#land' do
	it 'lands something' do
		expect(subject.land(plane).last).to eq plane
	end

	it 'raises an error when the airport is full' do
		subject.capacity.times { subject.land plane }
		expect { subject.land plane }.to raise_error 'Airport is full!'
	end

	it 'raises an error when the weather is stormy' do
		plane = double(:plane, stormy?: true)
		subject.land(plane)
		expect{subject.land(plane)}.to raise_error "It's too stormy to land!"
	end
  end

  describe '#depart' do
	  it 'departs something' do
		subject.land(plane)
		subject.depart(plane)
		expect(subject.planes).not_to include(plane)
	  end

	  it "raises an error when airport doesn't contain the plane" do
		expect {subject.depart plane }.to raise_error "That plane isn't here!"
	  end
  end

  it 'has a default capacity' do
	expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end


end
