class Twin < ActiveRecord::Base
  serialize :rankings

  include PgSearch
  pg_search_scope :search_by_name, :against => :name, :using => {
                    :tsearch => {:prefix => true}
                  }

  has_and_belongs_to_many :users
end

# full-text search using psql reference material
# https://github.com/Casecommons/pg_search/blob/master/README.md
# http://pivotallabs.com/pg-search-how-i-learned-to-stop-worrying-and-love-postgresql-full-text-search/
