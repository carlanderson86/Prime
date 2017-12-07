###
# Controller: PrimeController
#
# Controller for prime handling
#
# @author Carl Anderson
###
class PrimeController < ApplicationController

  ###
  # Method: calculate
  #
  # Description: Calculate the prime grid
  #
  # @author Carl Anderson
  ###
  def calculate
    valid = true
    message = ''
    data = {}

    begin
      validate

      grid_size = params[:grid_size]
      reference = params[:reference]

      data[:reference] = reference

      grid_size = grid_size.to_i

      data[:result] = PrimeJob.perform_now(grid_size, reference)

    rescue Exception => e
      Rails.logger.debug e
      valid = false
      message = e.message
    end

    response_obj = {
        valid:valid,
        message:message,
        data:data
    }

    render json: response_obj.to_json
  end

  ###
  # Method: validate
  #
  # Description: Validate the call
  #
  # @author Carl Anderson
  ###
  def validate
    grid_size = params[:grid_size]

    if grid_size.blank?
      raise 'Please provide a grid size'
    end

    grid_size = grid_size.to_i
    if grid_size <= 1
      raise 'Please provide a grid size greater than 1'
    end
  end

end
