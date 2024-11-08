module BooleanValidatable
  extend ActiveSupport::Concern

  class_methods do
    def validates_boolean *attrs
      validate do
        attrs.each do |attr|
          unless [true, false].include?(self[attr])
            errors.add(attr, "must be true or false")
          end
        end
      end
    end
  end
end
