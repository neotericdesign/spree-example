Spree::Order.class_eval do
  scope :visible_to, lambda { |user|
    includes(:ship_address => :country).where('"spree_countries".name IS IN (?)', user.countries.collect(&:name))
  }
end
