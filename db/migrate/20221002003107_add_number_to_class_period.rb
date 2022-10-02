class AddNumberToClassPeriod < ActiveRecord::Migration[6.1]
  def change
    add_column :class_periods, :number, :integer
  end
end
