# frozen_string_literal: true

require "test_helper"
require 'test/unit'
require 'passwordGenerator'

class PasswordGeneratorTest < Test::Unit::TestCase
  def test_generate
    password = PasswordGenerator.generate
    assert password.is_a?(String)
    assert_equal 10, password.length

    password = PasswordGenerator.generate(12)
    assert_equal 12, password.length
  end
end