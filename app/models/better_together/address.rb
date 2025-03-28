# frozen_string_literal: true

module BetterTogether
  class Address < ApplicationRecord # rubocop:todo Style/Documentation
    include PrimaryFlag
    include Privacy

    primary_flag_scope :contact_detail_id

    LABELS = %i[home work billing shipping other].freeze
    include Labelable

    belongs_to :contact_detail, class_name: 'BetterTogether::ContactDetail'

    # Validations
    validates :physical, :postal, inclusion: { in: [true, false] }
    validate :at_least_one_address_type

    protected

    def at_least_one_address_type
      return if physical || postal

      errors.add(:base, 'Address must be either physical, postal, or both')
    end
  end
end
