module Jinny::Entities
  class PaginationEntity < Grape::Entity
    expose :total_count
    expose :total_pages
    expose :next_page
    expose :prev_page
    expose :current_page
    expose :current_per_page
  end
end