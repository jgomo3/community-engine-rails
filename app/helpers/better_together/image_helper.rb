# frozen_string_literal: true

module BetterTogether
  # Helps with rendering images for various entities
  module ImageHelper
    def profile_image_tag(entity, options = {}) # rubocop:todo Metrics/MethodLength
      image_classes = "profile-image rounded-circle #{options[:class]}"
      image_style = (options[:style]).to_s
      image_size = options[:size] || 300

      # Determine if entity has a profile image
      if entity.respond_to?(:profile_image) && entity.profile_image.attached?
        attachment = if entity.respond_to?(:optimized_profile_image)
                       entity.optimized_profile_image
                     else
                       entity.profile_image_variant(image_size)
                     end

        image_tag(attachment.url, class: image_classes, style: image_style, alt: 'Profile Image')
      else
        # Use a default image based on the entity type
        default_image = default_profile_image(entity)
        image_tag(image_url(default_image), class: image_classes, style: image_style, alt: 'Default Profile Image')
      end
    end

    private

    def default_profile_image(entity)
      case entity.class.name
      when 'BetterTogether::Person'
        'profile_images/default_profile_image_person.jpg'
      when 'BetterTogether::Community'
        'profile_images/default_profile_image_community.jpg'
      else
        'profile_images/default_profile_image_generic.jpg'
      end
    end
  end
end
