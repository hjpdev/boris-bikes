require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'Should release a working bike when #release_bike is called' do
    ds = DockingStation.new
    ds.dock(Bike.new)
    bike = ds.release_bike
    expect(bike.is_a?(Bike) && bike.working?).to eq true
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'Should dock a bike when #dock is called' do
    bike = Bike.new
    expect(subject.dock(bike).include?(bike)).to eq true
  end

  it 'Should raise an error when there are no bikes & #release is called' do
    expect { subject.release_bike }.to raise_error('No bikes in station.')
  end

  it 'Should not dock any bikes if the station is full' do
    ds = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times { ds.dock(Bike.new) }
    expect { ds.dock(Bike.new) }.to raise_error('Dock full.')
  end
end