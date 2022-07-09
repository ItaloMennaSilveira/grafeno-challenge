# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../question3'

class Question2Tests < Minitest::Test
  def test_format1
    input = '97905796671Maria Neusa de00001234'

    subject = Question3.new(input, 'config/format-1.yaml').solucao
    expected_return = { cpf: '97905796671', name: 'Maria Neusa de', value: '1234' }

    assert_equal(expected_return, subject)
  end

  def test_format2
    input = '44010762900Ricardo Fontes00000567'

    subject = Question3.new(input, 'config/format-1.yaml').solucao
    expected_return = { cpf: '44010762900', name: 'Ricardo Fontes', value: '567' }

    assert_equal(expected_return, subject)
  end
end
