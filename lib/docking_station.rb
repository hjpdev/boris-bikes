require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail('No bikes in station.') if @bikes.empty?
    @bikes.pop
    Bike.new
  end

  def dock(bike)
    raise('Dock full.') if @bikes.length == 10
    @bikes << bike
  end
end