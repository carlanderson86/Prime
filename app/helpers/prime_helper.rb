###
# Module: PrimeHelper
#
# Helper to handle all the methods, means that we can call them from anywhere
#
# @author Carl Anderson
###
module PrimeHelper

  ###
  # Method: get_prime_grid
  #
  # Description: Get the grid of primes including blank spot
  #
  # @author Carl Anderson
  ###
  def self.get_prime_grid(grid_size:)
    primes = PrimeHelper.gather_primes(grid_size:grid_size)
    grid = PrimeHelper.build_prime_grid(primes:primes)

    return grid
  end

  private

  ###
  # Method: build_prime_grid
  #
  # Description: Build prime grid
  #
  # @param primes (Array of prime numbers)
  #
  # @author Carl Anderson
  ###
  def self.build_prime_grid(primes:)
    grid = []

    # Add the first line
    line = *primes
    line.unshift(' ')
    grid.push(line)
    # Get the rest
    for x in 0..primes.length - 1
      line = [primes[x]]
      for y in 0..primes.length - 1
        line.push(primes[x] * primes[y])
      end
      grid.push(line)
    end

    return grid
  end

  ###
  # Method: gather_primes
  #
  # Description: Gather the primes to fill a grid size
  #
  # @author Carl Anderson
  ###
  def self.gather_primes(grid_size:)
    primes = []
    count = 2
    increment = 1
    # Until we have the grid size we need, look for primes
    while primes.length < grid_size
      if PrimeHelper.is_prime(number:count)
        primes << count

        if primes.length % 1000 == 0
          Rails.logger.debug "Found #{primes.length} Primes"
        end
      end

      # Add on the increment
      count += increment

      # Skip the even numbers after 2
      if count == 2
        increment += 1
      end
    end

    return primes
  end

  ###
  # Method: is_prime
  #
  # Description: Figure out if this number is a prime
  #
  # @author Carl Anderson
  ###
  def self.is_prime(number:)
    # The loops first two visits are 2 and 3 which will rule out quite a few cases quickly.
    # No point in checking for anything greater than half.
    max = number/2
    for i in 2..max
      if number % i == 0
        return false
      end
    end

    return true
  end

end
