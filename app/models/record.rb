class Record < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  validates_presence_of :artist , :genre, :name
  validates_associated :artist , :genre
  validates :price, 
    :numericality => {:greater_than_or_equal_to => 0},
    presence: true
  validates :release_year, 
    :numericality => {:greater_than => 1500, :less_than_or_equal_to => Time.now.year},
    presence: true

  def self.search_(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
