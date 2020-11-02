require "administrate/field/base"

# Field for attributes that are backed by "array" like database fields of string
# values.
#
# IF options[:collection_options] is set, forms will use it to determine
# selectable options.
#
# Example:
#   my_field: MultiStringSelect.with_options(
#     collection_options: [["A", 1], ["B", 2]]
#   )
#
# IF options[:collection_options] is NOT set, forms will display input as a non
# restricted "tag" input.
#
class MultiStringSelect < Administrate::Field::Base
  def to_s
    data.map { |attribute| attribute.name }.join(", ")
  end

  def taglike_input?
    @options[:collection_options].blank?
  end

  def collection_options
    if taglike_input?
      selected_options || []
    else
      @options[:collection_options].transform_keys { |key| key.to_s.titleize }
    end
  end

  def selected_options
    data
  end

  def self.permitted_attribute(attribute, _options = nil)
    {attribute.to_sym => []}
  end

  def permitted_attribute
    self.class.permitted_attribute(attribute)
  end
end
