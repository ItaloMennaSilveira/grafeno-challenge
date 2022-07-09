# frozen_string_literal: true

class Question1
  ALLOWED_FIELDS = %i[name cpf state value].freeze
  MAX_FIELD_LENGTH = 10
  START_FILL_INDEX = 11

  def solucao(array_of_objects)
    sanitize_objects(array_of_objects)
  end

  private

  def sanitize_objects(array_of_objects)
    array_of_objects.map { |object| convert_hash_values_to_string(object) }.join("\n")
  end

  def convert_hash_values_to_string(hash)
    string = ''

    hash.each do |field, value|
      string += truncate_and_fill(value) if ALLOWED_FIELDS.include?(field)
    end

    string
  end

  def truncate_and_fill(string)
    string[0..MAX_FIELD_LENGTH].ljust(START_FILL_INDEX, ' ')
  end
end
