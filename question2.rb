# frozen_string_literal: true

require 'yaml'

class Question2
  ALLOWED_FIELDS = %i[name cpf state value].freeze

  def initialize(array_of_objects, format_yaml_path)
    @array_of_objects = array_of_objects
    @formats = YAML.load_file(format_yaml_path)
  end

  def solucao
    sanitize_objects
  end

  private

  def sanitize_objects
    @array_of_objects.map { |object| convert_hash_values_to_specific_format(object) }.join("\n")
  end

  def convert_hash_values_to_specific_format(hash)
    string = ''

    @formats.each do |field, value|
      next unless ALLOWED_FIELDS.include?(field.to_sym)

      string += format_field(hash[field.to_sym], value)
    end

    string
  end

  def format_field(value, field_format)
    value = value[0..field_format['length'] - 1]

    padding = ' '
    padding = '0' if field_format['padding'] == 'zeroes'

    return value.rjust(field_format['length'], padding) if field_format['align'] == 'right'

    value.ljust(field_format['length'], padding)
  end
end
