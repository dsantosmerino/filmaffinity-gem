# frozen_string_literal: true

module FilmAffinity
  module Src
    module Shared
      module Infra
        module Persistence
          # This class acts as an interface that we need to implement by defining
          # the entity that will wrap all the results.
          #
          # use_entity BoundedContext::Domain::Entity
          class InMemoryRepository < FilmAffinity::Src::Shared::Infra::Repository
            def initialize(data_source = [])
              @data_source = data_source
            end

            def all
              wrap_collection(data_source)
            end

            def where(**args)
              all.select do |data_source_record|
                args.all? do |field, expected_value|
                  value = data_source_record.public_send(field)
                  invidual_matcher(value, expected_value) ||
                    collection_matcher(value, expected_value)
                end
              end
            end

            def create(record)
              new_record = data_source.append(record).last

              wrap(new_record)
            end

            private

            attr_accessor :data_source

            def wrap(data_source_record)
              raise NotImplementedError
            end

            def wrap_collection(data_source_records)
              data_source_records.map do |data_source_record|
                wrap(data_source_record)
              end
            end

            def invidual_matcher(value, expected_value)
              value == expected_value
            end

            def collection_matcher(value, expected_value)
              return unless value.respond_to?(:include?)

              value.include?(expected_value)
            end
          end
        end
      end
    end
  end
end
