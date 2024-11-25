# frozen_string_literal: true

module BetterTogether
  # Base mailer for the engine
  class ApplicationMailer < ActionMailer::Base
    default from: ENV.fetch(
      'DEFAULT_FROM_EMAIL',
      'Better Together Community <community@bettertogethersolutions.com>'
    )
    layout 'better_together/mailer'

    around_action :set_locale_and_time_zone

    attr_accessor :time_zone, :locale

    def default_url_options
      super.merge(locale:)
    end

    private

    def set_locale_and_time_zone(&block)
      platform = BetterTogether::Platform.find_by(host: true) # Fetch the host platform

      self.time_zone ||= time_zone || platform&.time_zone || Rails.application.config.time_zone
      self.locale ||= locale || I18n.locale || platform&.locale || I18n.default_locale

      # Set time zone and locale either from platform or passed in by child mailers
      Time.use_zone(time_zone) do
        I18n.with_locale(locale, &block)
      end
    end
  end
end
