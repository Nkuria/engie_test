# frozen_string_literal: true

class ExtraAttribute < ApplicationRecord
  belongs_to :model, polymorphic: true
end
