# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../question1'

class Question1Tests < Minitest::Test
  def test_fields_filled_and_not_truncate
    input = [
      {
        name: 'Maria Silva',
        cpf: '97905796671',
        state: 'Sao Paulo',
        value: '1234'
      }
    ]

    subject = Question1.new.solucao(input)
    expected_return = 'Maria Silva97905796671Sao Paulo  1234       '

    assert_equal(expected_return, subject)
  end

  def test_name_truncated
    input = [
      {
        name: 'Maria Neusa de Aparecida',
        cpf: '97905796671',
        state: 'Sao Paulo',
        value: '1234'
      }
    ]

    subject = Question1.new.solucao(input)
    expected_return = 'Maria Neusa97905796671Sao Paulo  1234       '

    assert_equal(expected_return, subject)
  end

  def test_cpf_truncated
    input = [
      {
        name: 'Maria Silva',
        cpf: '97905796671111111111111',
        state: 'Sao Paulo',
        value: '1234'
      }
    ]

    subject = Question1.new.solucao(input)
    expected_return = 'Maria Silva97905796671Sao Paulo  1234       '

    assert_equal(expected_return, subject)
  end

  def test_state_truncated
    input = [
      {
        name: 'Maria Silva',
        cpf: '97905796671',
        state: 'Rio Grande do Sul',
        value: '1234'
      }
    ]

    subject = Question1.new.solucao(input)
    expected_return = 'Maria Silva97905796671Rio Grande 1234       '

    assert_equal(expected_return, subject)
  end

  def test_value_truncated
    input = [
      {
        name: 'Maria Silva',
        cpf: '97905796671',
        state: 'Rio Grande do Sul',
        value: '12345678900000000000000000000000000000'
      }
    ]

    subject = Question1.new.solucao(input)
    expected_return = 'Maria Silva97905796671Rio Grande 12345678900'

    assert_equal(expected_return, subject)
  end

  def test_more_than_one_hashs
    input = [
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

    subject = Question1.new.solucao(input)
    expected_return = "Maria Neusa97905796671Sao Paulo  1234       \nRicardo Fon44010762900Rio Grande 567        "

    assert_equal(expected_return, subject)
  end

  def test_with_not_allowed_fields
    input = [
      {
        bairro: 'Centro',
        name: 'Maria Neusa de Aparecida',
        idade: '33',
        cpf: '97905796671',
        state: 'Sao Paulo',
        value: '1234'
      }
    ]

    subject = Question1.new.solucao(input)
    expected_return = 'Maria Neusa97905796671Sao Paulo  1234       '

    assert_equal(expected_return, subject)
  end
end
