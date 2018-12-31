class Song < ApplicationRecord
  def self.search(search)
    where("title ILIKE ? OR artist ILIKE ? OR number ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
