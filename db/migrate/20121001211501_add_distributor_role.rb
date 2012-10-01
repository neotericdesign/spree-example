class AddDistributorRole < ActiveRecord::Migration
  @roles = %w[distributor]
  def self.up
    @roles.each do |r|
      Spree::Role.create(:name => r)
    end
  end

  def self.down
    @roles.each do |r|
      Spree::Role.where(:name => r).first.destroy
    end
  end
end
