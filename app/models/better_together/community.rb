# frozen_string_literal: true

module BetterTogether
  # A gathering
  class Community < ApplicationRecord
    include Contactable
    include Host
    include Identifier
    include Joinable
    include Protected
    include Privacy
    include Permissible

    belongs_to :creator,
               class_name: '::BetterTogether::Person',
               optional: true

    joinable joinable_type: 'community',
             member_type: 'person'

    slugged :name

    translates :name
    translates :description, type: :text
    translates :description_html, backend: :action_text

    has_one_attached :profile_image do |attachable|
      attachable.variant :optimized_jpeg, resize_to_limit: [200, 200],
                                          saver: { strip: true, quality: 75, interlace: true, optimize_coding: true, trellis_quant: true, quant_table: 3 }, format: 'jpg'
      attachable.variant :optimized_png, resize_to_limit: [200, 200],
                                         saver: { strip: true, quality: 75, optimize_coding: true }, format: 'png'
    end

    has_one_attached :cover_image

    # Virtual attributes to track removal
    attr_accessor :remove_profile_image, :remove_cover_image

    # Callbacks to remove images if necessary
    before_save :purge_profile_image, if: -> { remove_profile_image == '1' }
    before_save :purge_cover_image, if: -> { remove_cover_image == '1' }

    validates :name,
              presence: true
    validates :description,
              presence: true

    def optimized_profile_image
      if profile_image.content_type == 'image/svg+xml'
        # If SVG, return the original without transformation
        profile_image
      else
        # For other formats, analyze to determine transparency
        metadata = profile_image.metadata
        if profile_image.content_type == 'image/png' && metadata[:alpha]
          # If PNG with transparency, return the optimized PNG variant
          profile_image.variant(:optimized_png)
        else
          # Otherwise, use the optimized JPG variant
          profile_image.variant(:optimized_jpeg)
        end
      end
    end

    def to_s
      name
    end

    include ::BetterTogether::RemoveableAttachment
  end
end
