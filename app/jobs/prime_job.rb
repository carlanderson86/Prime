###
# Class: PrimeJob
#
# Job to make this task able to go async.  Means we can ask for larger grids and not lock up the server.
# Use cables to provide a response.
#
# @author Carl Anderson
###
class PrimeJob < ApplicationJob
  queue_as :default

  ###
  # Method: perform
  #
  # Description: Run this job
  #
  # Required 2 arguments
  # @param grid_size
  # @param reference
  #
  # @author Carl Anderson
  ###
  def perform(*args)
    grid_size = args[0]
    reference = args[1]

    result = PrimeHelper.get_prime_grid(grid_size:grid_size)

    return result
  end
end
