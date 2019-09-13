require 'csv'

class User < ActiveRecord::Base

  def self.to_csv
    required_fields = %w(id first_name last_name city age gender)

    CSV.generate do |csv|
      csv << required_fields

      all.each do |user|
        csv << user.attributes.values_at(*required_fields)
      end
    end
  end
end
