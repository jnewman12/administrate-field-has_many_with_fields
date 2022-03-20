require "administrate/order"
require "administrate/field/has_many"
require "administrate/field/base"
require "rails"

module Administrate
  module Field
    class HasManyWithFields < Administrate::Field::HasMany
      class Engine < ::Rails::Engine
      end

      def associated_collection(order = self.override_order)
        CollectionWithFields.new(
          associated_dashboard,
          order: order,
          fields: options[:fields],
        )
      end

      def override_order
        @order ||= Administrate::Order.new(sort_by, direction)
      end
    end
  end
end

class CollectionWithFields < Administrate::Page::Collection
  def attributes_for(resource)
    selected_attribute_names.map do |attr_name|
      attribute_field(dashboard, resource, attr_name, :index)
    end
  end

  def attribute_types
    dashboard.attribute_types_for(attribute_names)
    dashboard.attribute_types_for(selected_attribute_names)
  end

  def selected_attribute_names
    Array(options[:fields] || attribute_names)
  end
end
