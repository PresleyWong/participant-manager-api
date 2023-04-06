class Api::V1::SettingsController < ApplicationController
  skip_before_action :authenticate_user, only: [:show]
  before_action :set_setting, only: %i[show update]


  # GET /api/v1/settings
  def show
    render json: @setting
  end


  # PATCH/PUT /api/v1/settings
  def update
    if @setting.update(setting_params)
      render json: @setting
    else
      render json: @setting.errors, status: :unprocessable_entity
    end
  end



  private
    def set_setting
      @setting = Setting.instance
    end

    def setting_params
        params.permit(
        :header_bg_light_color, 
        :header_text_light_color,
        :navbar_bg_light_color, 
        :navbar_text_light_color, 
        :footer_bg_light_color, 
        :footer_text_light_color, 
        :primary_button_bg_light_color,
        :primary_button_text_light_color,
        :secondary_button_bg_light_color, 
        :secondary_button_text_light_color, 
        :info_button_bg_light_color, 
        :info_button_text_light_color, 
        :primary_outline_button_bg_light_color,
        :primary_outline_button_text_light_color, 
        :error_outline_button_bg_light_color, 
        :error_outline_button_text_light_color, 
        :main_bg_light_color, 
        :card_header_bg_light_color, 
        :card_header_text_light_color, 
        :card_bg_light_color, 
        :card_text_light_color, 
        :table_header_bg_light_color, 
        :table_header_text_light_color,
        :table_strip_odd_bg_light_color,
        :table_strip_even_bg_light_color, 
        :table_text_light_color,
        :brother_text_light_color,
        :sister_text_light_color,
        :header_bg_dark_color, 
        :header_text_dark_color,
        :navbar_bg_dark_color, 
        :navbar_text_dark_color, 
        :footer_bg_dark_color, 
        :footer_text_dark_color, 
        :primary_button_bg_dark_color,
        :primary_button_text_dark_color,
        :secondary_button_bg_dark_color, 
        :secondary_button_text_dark_color, 
        :info_button_bg_dark_color, 
        :info_button_text_dark_color, 
        :primary_outline_button_bg_dark_color,
        :primary_outline_button_text_dark_color, 
        :error_outline_button_bg_dark_color, 
        :error_outline_button_text_dark_color, 
        :main_bg_dark_color, 
        :card_header_bg_dark_color, 
        :card_header_text_dark_color, 
        :card_bg_dark_color, 
        :card_text_dark_color, 
        :table_header_bg_dark_color, 
        :table_header_text_light_color,
        :table_strip_odd_bg_dark_color,
        :table_strip_even_bg_dark_color, 
        :table_text_dark_color,
        :brother_text_dark_color,
        :sister_text_dark_color,
        )
    end

end
