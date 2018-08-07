require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise('No bikes in station.') if empty?
    @bikes.pop
    Bike.new
  end

  def dock(bike)
    raise('Dock full.') if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length == DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end

