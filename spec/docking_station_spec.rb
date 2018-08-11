require 'docking_station'
require 'bike'

describe DockingStation do
  let(:workingBike) { double :bike, class: Bike, condition: true, :condition= => nil }
  let(:brokenBike) { double :bike, class: Bike, condition: true, :condition= => nil }

  it 'initializes with @bikes being empty' do
    expect(subject.bikes.empty?).to eq true
  end

  it 'returns a Bike object when #release_bike is called' do
    subject.dock(workingBike)
    expect(subject.release_bike.class).to eq Bike
  end

  it 'should release a working bike when #release_bike is called' do
    subject.dock(brokenBike)
    bike = subject.release_bike
    expect(bike.condition).to eq true
  end

  it 'should dock a bike when #dock is called' do
    expect(subject.dock(workingBike).include?(workingBike)).to eq true
  end

  it 'should raise an error when there are no bikes & #release is called' do
    expect { subject.release_bike }.to raise_error('No bikes in station.')
  end

  it 'should not dock any bikes if the station is full' do
    subject.capacity.times { subject.dock(workingBike) }
    expect { subject.dock(workingBike) }.to raise_error('Dock full.')
  end

  it 'should set default capacity to DEFAULT_CAPACITY' do
    ds = DockingStation.new
    expect(ds.capacity).to eq 20
  end
end