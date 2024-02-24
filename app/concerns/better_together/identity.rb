# frozen_string_literal: true

module BetterTogether
  module Identity
    extend ActiveSupport::Concern

    included do
      has_many :identifications,
               as: :identity
    end
  end
end
