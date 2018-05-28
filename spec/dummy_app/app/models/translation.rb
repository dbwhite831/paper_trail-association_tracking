# frozen_string_literal: true

# Demonstrates the `if` and `unless` configuration options.
class Translation < ActiveRecord::Base
  # Has a `type` column, but it's not used for STI.
  self.inheritance_column = nil

  has_paper_trail(
    if: proc { |t| t.language_code == "US" },
    unless: proc { |t| t.type == "DRAFT" }
  )
end
