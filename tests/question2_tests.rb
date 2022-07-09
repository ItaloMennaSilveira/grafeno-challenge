# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../question2'

class Question2Tests < Minitest::Test
  def test_format1
    subject = Question2.new(input, 'config/format-1.yaml').solucao
    expected_return = "97905796671Maria Neusa de00001234\n44010762900Ricardo Fontes00000567"

    assert_equal(expected_return, subject)
  end

  def test_format2
    subject = Question2.new(input, 'config/format-2.yaml').solucao
    expected_return = "0009790579667100001234Sao Paulo     \n0004401076290000000567Rio Grande do "

    assert_equal(expected_return, subject)
  end

  private

  def input
    [
      {
        name: 'Maria Neusa de Aparecida',
        cpf: '97905796671',
        state: 'Sao Paulo',
        value: '1234'
      },
      {
        name: 'Ricardo Fontes',
        cpf: '44010762900',
        state: 'Rio Grande do Sul',
        value: '567'
      }
    ]
  end
end
