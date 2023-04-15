class Setting < ApplicationRecord
    validates :singleton_guard, inclusion: { in: [0] }

    def self.instance
        first_or_create! do |setting|
            setting.singleton_guard = 0
            
            setting.header_bg_light_color = "#FCF8FD" 
            setting.header_bg_dark_color = "#1B1B1F" 
            setting.header_text_light_color = "#4B53BC"
            setting.header_text_dark_color = "#BFC2FF"            

            setting.navbar_bg_light_color = "#4B53BC"
            setting.navbar_bg_dark_color = "#BFC2FF"
            setting.navbar_text_light_color = "#FFFFFF"
            setting.navbar_text_dark_color = "#181D8C"

            setting.footer_bg_light_color = "#5C5D72"
            setting.footer_bg_dark_color = "#C5C4DD"
            setting.footer_text_light_color = "#FFFFFF"
            setting.footer_text_dark_color = "#2E2F42"

            setting.primary_button_bg_light_color = "#E0E0FF"
            setting.primary_button_bg_dark_color = "#3239A3"
            setting.primary_button_text_light_color = "#00006E"
            setting.primary_button_text_dark_color = "#E0E0FF"

            setting.secondary_button_bg_light_color = "#E1E0F9"
            setting.secondary_button_bg_dark_color = "#444559"
            setting.secondary_button_text_light_color = "#191A2C"
            setting.secondary_button_text_dark_color = "#E1E0F9"

            setting.info_button_bg_light_color = "#E3E3DC"
            setting.info_button_bg_dark_color = "#464743"
            setting.info_button_text_light_color = "#1A1C18"
            setting.info_button_text_dark_color = "#C6C7C0"

            setting.primary_outline_button_bg_light_color = "#00006E"
            setting.primary_outline_button_bg_dark_color = "#E0E0FF"
            setting.primary_outline_button_text_light_color = "#00006E"
            setting.primary_outline_button_text_dark_color = "#E0E0FF"

            setting.error_outline_button_bg_light_color = "#BA1A1A"
            setting.error_outline_button_bg_dark_color = "#FFB4AB"
            setting.error_outline_button_text_light_color = "#BA1A1A"
            setting.error_outline_button_text_dark_color = "#FFB4AB"

            setting.main_bg_light_color = "#FFFBFF"
            setting.main_bg_dark_color = "#1B1B1F"

            setting.card_header_bg_light_color = "#5C5D72"
            setting.card_header_bg_dark_color = "#C5C4DD"

            setting.card_header_text_light_color = "#FFFFFF"
            setting.card_header_text_dark_color = "#2E2F42"

            setting.card_bg_light_color = "#FFFFFF"
            setting.card_bg_dark_color = "#0E0E10"

            setting.card_text_light_color = "#1B1B1F"         
            setting.card_text_dark_color = "#E5E1E6"

            setting.table_header_bg_light_color = "#5C5D72"
            setting.table_header_bg_dark_color = "#C5C4DD"
            setting.table_header_text_light_color = "#FFFFFF"
            setting.table_header_text_dark_color = "#C6C7C0"
            setting.table_strip_odd_bg_light_color = "#FBF8FF"
            setting.table_strip_odd_bg_dark_color = "#191920"
            setting.table_strip_even_bg_light_color = "#FFFFFF"
            setting.table_strip_even_bg_dark_color = "#0E0E10"
            setting.table_text_light_color = "#1A202C"
            setting.table_text_dark_color = "#FFFFFF"

            setting.brother_text_light_color = "#4B53BC"
            setting.brother_text_dark_color = "#BFC2FF"
            setting.sister_text_light_color = "#C565A0"
            setting.sister_text_dark_color = "#FFD8EE"

            setting.input_border_light_color = "#00006E"
            setting.input_border_dark_color = "#E0E0FF"
        end
    end

end
