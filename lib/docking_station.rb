require_relative 'bike'
require_relative 'bike_container'

class DockingStation < BikeContainer

  def initialize()
    super()
  end

  def release_bike(bike)
    fail "Sorry, there are no bikes available for hire" if no_bikes_remaining?
    fail "Sorry, this bike is broken" if bike.broken?
    remove_bike(bike)
  end

  def dock(bike)
    fail "Sorry, there are no free slots to dock a bike" if station_full?
    add(bike)
  end

  def release_broken_bikes
    bikes.select{ |bike| select_working_bike(bike) }.map!{ |selectedBike| remove_bike(selectedBike) }
  end

  def count_bikes
    bikes.count
  end

  def select_working_bike(bike)
    bike.working? == false
  end

  def remove_bike(bike)
    bikes.delete(bike)
  end

    private

    def no_bikes_remaining?
      bikes.empty?
    end

    def station_full?
      bikes.length >= capacity
    end

end
