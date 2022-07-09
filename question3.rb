# frozen_string_literal: true

require 'yaml'

class Question3
  def initialize(string, format_yaml_path)
    @string = string
    @formats = YAML.load_file(format_yaml_path)
  end

  def solucao
    convert_string_to_hash
  end

  private

  def convert_string_to_hash
    hash = {}
    start_field_position = 0

    @formats.each do |field, field_format|
      end_field_position = start_field_position + field_format['length'] - 1
      extract_field_value_to_hash(start_field_position, end_field_position, field, field_format, hash)
      start_field_position = end_field_position + 1
    end

    hash.transform_keys(&:to_sym)
  end

  def extract_field_value_to_hash(start_field_position, end_field_position, field, field_format, hash)
    if field_format['padding'] == 'zeroes'
      return hash[field] = if field_format['align'] == 'right'
                             @string[start_field_position..end_field_position].sub!(/^0+/, '')
                           else
                             @string[start_field_position..end_field_position].sub!(/0+$/, '')
                           end
    end

    hash[field] = @string[start_field_position..end_field_position].strip
  end
end
