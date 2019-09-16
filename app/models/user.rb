class User < ActiveRecord::Base
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      User.create!(row.to_h)
    end
  end

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
