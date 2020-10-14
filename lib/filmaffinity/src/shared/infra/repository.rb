# frozen_string_literal: true

module FilmAffinity
  module Src
    module Shared
      module Infra
        class Repository
          class << self
            attr_reader :entity

            def use_entity(entity)
              @entity = entity
            end
          end

          def entity
            self.class.entity
          end
        end
      end
    end
  end
end
