# frozen_string_literal: true

module BetterTogether
  class RolePolicy < ApplicationPolicy # rubocop:todo Style/Documentation
    def create?
      false
    end

    class Scope < Scope # rubocop:todo Style/Documentation
      def resolve
        scope.all
      end
    end
  end
end
