# frozen_string_literal: true

module BetterTogether
  class PhoneNumberPolicy < ContactDetailPolicy
    # Inherits from ContactDetailPolicy

    class Scope < ContactDetailPolicy::Scope
    end
  end
end
