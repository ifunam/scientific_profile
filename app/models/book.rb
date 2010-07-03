class Book < ActiveRecord::Base
  normalize_attributes :title, :authors
  validates_presence_of :title, :authors
  validates_uniqueness_of :title, :scope => [:authors]

  belongs_to :mod_user, :class_name => 'User'

  has_one :book_edition
  accepts_nested_attributes_for :book_edition

  def as_text
    "#{authors}. #{title}."
  end

  def vol
    volume.to_s.strip.empty? ? nil : "Vol. #{volume}"
  end
end
