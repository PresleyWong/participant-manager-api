class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.integer  :singleton_guard

      t.string :header_bg_light_color
      t.string :header_text_light_color
      t.string :navbar_bg_light_color
      t.string :navbar_text_light_color
      t.string :footer_bg_light_color
      t.string :footer_text_light_color
      t.string :primary_button_bg_light_color
      t.string :primary_button_text_light_color
      t.string :secondary_button_bg_light_color
      t.string :secondary_button_text_light_color
      t.string :info_button_bg_light_color
      t.string :info_button_text_light_color
      t.string :primary_outline_button_bg_light_color
      t.string :primary_outline_button_text_light_color
      t.string :error_outline_button_bg_light_color
      t.string :error_outline_button_text_light_color
      t.string :main_bg_light_color
      t.string :card_header_bg_light_color
      t.string :card_header_text_light_color
      t.string :card_bg_light_color
      t.string :card_text_light_color
      t.string :table_header_bg_light_color
      t.string :table_header_text_light_color
      t.string :table_strip_odd_bg_light_color
      t.string :table_strip_even_bg_light_color
      t.string :table_text_light_color      
      t.string :brother_text_light_color
      t.string :sister_text_light_color

      t.string :header_bg_dark_color
      t.string :header_text_dark_color
      t.string :navbar_bg_dark_color
      t.string :navbar_text_dark_color
      t.string :footer_bg_dark_color
      t.string :footer_text_dark_color
      t.string :primary_button_bg_dark_color
      t.string :primary_button_text_dark_color
      t.string :secondary_button_bg_dark_color
      t.string :secondary_button_text_dark_color
      t.string :info_button_bg_dark_color
      t.string :info_button_text_dark_color
      t.string :primary_outline_button_bg_dark_color
      t.string :primary_outline_button_text_dark_color
      t.string :error_outline_button_bg_dark_color
      t.string :error_outline_button_text_dark_color
      t.string :main_bg_dark_color
      t.string :card_header_bg_dark_color
      t.string :card_header_text_dark_color
      t.string :card_bg_dark_color
      t.string :card_text_dark_color
      t.string :table_header_bg_dark_color
      t.string :table_header_text_dark_color
      t.string :table_strip_odd_bg_dark_color
      t.string :table_strip_even_bg_dark_color
      t.string :table_text_dark_color
      t.string :brother_text_dark_color
      t.string :sister_text_dark_color


      t.timestamps
    end

  
    add_index :settings, :singleton_guard, unique: true
    
  end
end
