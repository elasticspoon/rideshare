# frozen_string_literal: true

class InstallBlazer < ActiveRecord::Migration[6.0]
  def change
    create_table :blazer_queries do |t|
      t.references :creator
      t.string :name
      t.text :description
      t.text :statement
      t.string :data_source
      t.timestamps null: false
    end

    create_table :blazer_audits do |t|
      t.references :user
      t.references :query
      t.text :statement
      t.string :data_source
      t.timestamp :created_at
    end

    create_table :blazer_dashboards do |t|
      t.references :creator
      t.text :name
      t.timestamps null: false
    end

    create_table :blazer_dashboard_queries do |t|
      t.references :dashboard
      t.references :query
      t.integer :position
      t.timestamps null: false
    end

    create_table :blazer_checks do |t|
      t.references :creator
      t.references :query
      t.string :state
      t.string :schedule
      t.text :emails
      t.text :slack_channels
      t.string :check_type
      t.text :message
      t.timestamp :last_run_at
      t.timestamps null: false
    end
  end
end
