# frozen_string_literal: true

module CustomAttributeable
  extend ActiveSupport::Concern

  included do
    has_many :extra_attributes, as: :model
  end

  def set_custom_attribute(attribute_name, value)
    custom_attribute = extra_attributes.find_or_initialize_by(attribute_name:)
    custom_attribute.update(attribute_value: value)
  end

  def get_custom_attribute(attribute_name)
    custom_attribute = extra_attributes.find_by(attribute_name:)
    custom_attribute&.attribute_value
  end

  def method_missing(method_name, *args)
    attribute_name = method_name.to_s
    if attribute_name.ends_with?('=')
      set_custom_attribute(attribute_name.chomp('='), args.first)
    else
      get_custom_attribute(attribute_name)
    end
  end

  def respond_to_missing?(method_name, _include_private = false)
    attribute_name = method_name.to_s.chomp('=')
    extra_attributes.where(attribute_name:).exists? || super
  end
end
