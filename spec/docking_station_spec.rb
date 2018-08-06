require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "Should release a working bike when #release_bike is called" do
    bike = subject.release_bike
    expect(bike.is_a?(Bike) && bike.working?).to eq true
  end
end