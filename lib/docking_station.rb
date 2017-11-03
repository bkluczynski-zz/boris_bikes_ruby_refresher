require_relative 'bike'
require_relative 'storing_facility'

class DockingStation < StoringFacility

  DEFAULT_CAPACITY = 20;

  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    super()
    @capacity = capacity;
  end

  def release_bike(bike)
    fail "Sorry, there are no bikes available for hire" if no_bikes_remaining?
    fail "Sorry, this bike is broken" if bike.broken?
    bikes.delete(bike)
  end

  def dock(bike)
    fail "Sorry, there are no free slots to dock a bike" if station_full?
    bikes.push(bike)
  end

  def release_broken_bikes
    bikes.select{ |bike| bike.working? == false }.map!{ |selectedBike| bikes.delete(selectedBike) }
  end

  def count_bikes
    bikes.count
  end

    private

    attr_reader :bikes

    def no_bikes_remaining?
      bikes.empty?
    end

    def station_full?
      bikes.length >= capacity
    end

end
