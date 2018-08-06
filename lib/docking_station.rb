class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    @bikes.pop
    Bike.new
  end
end