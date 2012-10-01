class CountriesUser < ActiveRecord::Base
  belongs_to :country, :class_name => 'Spree::Country'
  belongs_to :user, :class_name    => 'Spree::User'

  def self.country_ids
    select(:country_id).all.collect(&:country_id).uniq.compact
  end
end
