class Setting < ApplicationRecord
    validates :singleton_guard, inclusion: { in: [0] }

    def self.instance
        first_or_create! do |setting|
            setting.singleton_guard = 0
            
            setting.header_bg_light_color = "#DFE4D7" 
            setting.header_bg_dark_color = "#2D3229" 
            setting.header_text_light_color = "#008080"
            setting.header_text_dark_color = "#008080"
            

            setting.navbar_bg_light_color = "#679F52"
            setting.navbar_bg_dark_color = "#366A25"
            setting.navbar_text_light_color = "#FFFFFF"
            setting.navbar_text_dark_color = "#B6F29C"

            setting.footer_bg_light_color = "#1F510E"
            setting.footer_bg_dark_color = "#0E3903"
            setting.footer_text_light_color = "#FFFFFF"
            setting.footer_text_dark_color = "#B6F29C"

            setting.primary_button_bg_light_color = "#98D682"
            setting.primary_button_bg_dark_color = "#80BA69"
            setting.primary_button_text_light_color = "#052101"
            setting.primary_button_text_dark_color = "#0E3903"

            setting.secondary_button_bg_light_color = "#24BDC0"
            setting.secondary_button_text_light_color = "#012021"
            setting.secondary_button_bg_dark_color = "#0DA0A3"
            setting.secondary_button_text_dark_color = "#012021"

            setting.info_button_bg_light_color = "#E3E3DC"
            setting.info_button_text_light_color = "#1A1C18"
            setting.info_button_bg_dark_color = "#464743"
            setting.info_button_text_dark_color = "#C6C7C0"

            setting.primary_outline_button_bg_light_color = "#4E843B"
            setting.primary_outline_button_text_light_color = "#4E843B"
            setting.primary_outline_button_bg_dark_color = "#80BA69"
            setting.primary_outline_button_text_dark_color = "#80BA69"

            setting.error_outline_button_bg_light_color = "#B92123"
            setting.error_outline_button_text_light_color = "#DD3C38"
            setting.error_outline_button_bg_dark_color = "#FEB5AD"
            setting.error_outline_button_text_dark_color = "#FE8B80"

            setting.main_bg_light_color = "#FDFDF6"
            setting.main_bg_dark_color = "#1A1C18"

            setting.card_header_bg_light_color = "#5D5F5A"
            setting.card_header_text_light_color = "#FFFFFF"
            setting.card_bg_light_color = "#FFFFFF"
            setting.card_text_light_color = "#000000"

            setting.card_header_bg_dark_color = "#000000"
            setting.card_header_text_dark_color = "#C6C7C0"
            setting.card_bg_dark_color = "#2F312D"
            setting.card_text_dark_color = "#C6C7C0"

            setting.table_header_bg_light_color = "#5D5F5A"
            setting.table_header_text_light_color = "#FFFFFF"
            setting.table_strip_odd_bg_light_color = "#F1F1EA"
            setting.table_strip_even_bg_light_color = "#FFFFFF"
            setting.table_text_light_color = "#1A202C"

            setting.table_header_bg_dark_color = "#000000"
            setting.table_header_text_dark_color = "#C6C7C0"
            setting.table_strip_odd_bg_dark_color = "#2F312D"
            setting.table_strip_even_bg_dark_color = "#1A1C18"
            setting.table_text_dark_color = "#FFFFFF"

            setting.brother_text_light_color = "#366A25"
            setting.sister_text_light_color = "#B92123"
            setting.brother_text_dark_color = "#98D682"
            setting.sister_text_dark_color = "#FEB5AD"
        end
    end

end
