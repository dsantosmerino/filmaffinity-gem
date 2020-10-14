# frozen_string_literal: true

module FilmAffinity
  module Src
    module Domain
      class Movie < FilmAffinity::Src::Shared::Domain::AggregateRoot
        attribute :id,          Strict::Integer
        attribute :title,       Strict::String
        attribute :year,        Strict::Integer.optional.meta(omittable: true)
        attribute :duration,    Strict::Integer.optional.meta(omittable: true)
        attribute :country,     Strict::String.optional.meta(omittable: true)
        attribute :director,    Strict::String.optional.meta(omittable: true)
        attribute :music,       Strict::String.optional.meta(omittable: true)
        attribute :company,     Strict::String.optional.meta(omittable: true)
        attribute :script,      Strict::String.optional.meta(omittable: true)
        attribute :photography, Strict::String.optional.meta(omittable: true)
        attribute :cast,        Strict::Array.of(Strict::String).optional.meta(omittable: true).default([].freeze)
        attribute :genres,      Strict::Array.of(Strict::String).optional.meta(omittable: true).default([].freeze)
        attribute :sinopsis,    Strict::String.optional.meta(omittable: true)
        attribute :rating,      Strict::Float.optional.meta(omittable: true)
        attribute :poster,      Strict::String.optional.meta(omittable: true)
        attribute :poster_big,  Strict::String.optional.meta(omittable: true)

        def to_json(**_args)
          attributes.to_json
        end
      end
    end
  end
end
