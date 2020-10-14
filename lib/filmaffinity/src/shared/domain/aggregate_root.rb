# frozen_string_literal: true

module FilmAffinity
  module Src
    module Shared
      module Domain
        class AggregateRoot < Dry::Struct
          include Dry.Types()
        end
      end
    end
  end
end
