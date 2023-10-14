# frozen_string_literal: true

require 'test_helper'

class CustomAttributeTest < ActiveSupport::TestCase
  test 'setting and getting custom attributes' do
    customer = Customer.create(name: 'John')

    # Set custom attributes
    customer.favorite_color = 'Blue'
    customer.hobby = 'Gardening'

    # custom attributes can be retrieved
    assert_equal 'Blue', customer.favorite_color
    assert_equal 'Gardening', customer.hobby

    # Modify custom attributes
    customer.favorite_color = 'Red'
    assert_equal 'Red', customer.favorite_color

    # Non-existent custom attribute should return nil
    assert_nil customer.non_existent_attribute

    # multiple custom attributes
    customer.age = 30
    assert_equal '30', customer.age
  end

  test 'it works with other models' do
    battery = Battery.create(capacity: 100)

    # Setting custom attributes
    battery.voltage = '12V'
    battery.manufacturer = 'batter_maker'

    # custom attributes can be retrieved
    assert_equal '12V', battery.voltage
    assert_equal 'batter_maker', battery.manufacturer

    # update value
    battery.voltage = '24V'
    assert_equal '24V', battery.voltage

    # Non-existent custom attribute returns nil
    assert_nil battery.non_existent_attribute

    # multiple custom attributes work for Battery
    battery.weight = 5
    assert_equal '5', battery.weight
  end
end
