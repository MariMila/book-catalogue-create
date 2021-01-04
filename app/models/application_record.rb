class ApplicationRecord < ActiveRecord::Base
  validates :title, :author, :publication_year, :abstract, :genre, presence: true
  self.abstract_class = true
end
