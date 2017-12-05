require 'test_helper'

class PrimeControllerTest < ActionDispatch::IntegrationTest

  test 'calculate_min' do

    grid_size = 2
    reference = SecureRandom.uuid

    get "/prime/calculate?grid_size=#{grid_size}&reference=#{reference}"

    body = JSON.parse(response.body)

    valid = body['valid']
    data = body['data']

    assert(valid,'Invalid Response')
    assert_not_nil(data,'Invalid Result')
  end

  test 'calculate_mid' do

    grid_size = 20
    reference = SecureRandom.uuid

    get "/prime/calculate?grid_size=#{grid_size}&reference=#{reference}"

    body = JSON.parse(response.body)

    valid = body['valid']
    data = body['data']

    assert(valid,'Invalid Response')
    assert_not_nil(data,'Invalid Result')
  end

  test 'calculate_high' do

    grid_size = 200
    reference = SecureRandom.uuid

    get "/prime/calculate?grid_size=#{grid_size}&reference=#{reference}"

    body = JSON.parse(response.body)

    valid = body['valid']
    data = body['data']

    assert(valid,'Invalid Response')
    assert_not_nil(data,'Invalid Result')
  end

  test 'calculate_fail' do

    grid_size = 1
    reference = SecureRandom.uuid

    get "/prime/calculate?grid_size=#{grid_size}&reference=#{reference}"

    body = JSON.parse(response.body)

    valid = body['valid']

    assert(!valid,'Invalid Response')
  end

end


