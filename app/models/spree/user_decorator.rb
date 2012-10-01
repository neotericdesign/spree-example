Spree::User.class_eval do
  has_many :countries_users, :dependent => :destroy
  has_many :countries, :through => :countries_users, :uniq => true

  attr_accessible :country_ids

  def self.distributor_for(country)
    distributor.select { |d| d.countries.include?(country) }.first
  end

  scope :distributor, lambda {
    includes(:spree_roles).where("spree_roles.name" => "distributor")
  }
end
