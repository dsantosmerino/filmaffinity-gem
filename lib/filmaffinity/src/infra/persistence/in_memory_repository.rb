# frozen_string_literal: true

module FilmAffinity
  module Src
    module Infra
      module Persistence
        class InMemoryRepository < FilmAffinity::Src::Shared::Infra::Persistence::InMemoryRepository
          use_entity FilmAffinity::Src::Domain::Movie

          def initialize(data_source = [])
            super(data_source)
          end

          private

          def wrap(data_source_record)
            entity.new(data_source_record)
          end
        end
      end
    end
  end
end
