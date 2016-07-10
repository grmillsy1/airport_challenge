require 'airport'

describe Airport do

  describe '#land_plane' do
    subject(:plane) { described_class.new }
      it 'lands a plane' do
      expect(subject.land(plane)).to eq [plane]
    end
      it 'has docked the plane' do
        subject.land(plane)
        expect(subject.planes).to include(plane)
      end
  end

    describe '#take_off' do
      subject(:plane) { described_class.new }
      it 'instructs the plane to take off from the Airport' do
        subject.land(plane)
        expect(subject.take_off).to eq plane
      end
      it 'confirms the plane has left the airport' do
      subject.take_off
      expect(subject.planes).not_to include(plane)
    end
  end

    describe '#capacity' do
       it 'prevents planes landing if there is no room' do
       described_class::DEFAULT_CAPACITY.times{subject.land(Airplane.new)}
       expect {subject.land(Airplane.new)}.to raise_error "Airport full"
     end
   end
   it 'has a default capacity' do
     expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end
    it 'can change its capacity depending on the user' do
      airport = Airport.new(50)
      50.times { airport.land Airplane.new }
      expect{ airport.land Airplane.new }.to raise_error 'Airport full'
    end
end
