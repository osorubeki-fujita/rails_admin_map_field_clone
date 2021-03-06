module RailsAdmin::Config::Fields::Types
  class Map < RailsAdmin::Config::Fields::Base
    RailsAdmin::Config::Fields::Types::register(:map, self)

    def allowed_methods
      [@name, longitude_field]
    end

    # THe name of the corresponding longitude field to match the latitude field
    # in this object.
    register_instance_option(:longitude_field) do
      :longitude
    end

    register_instance_option(:partial) do
      :form_map
    end

    # Language of the map
    register_instance_option(:language) do
      :en
    end

    # Google Maps API Key - optional
    register_instance_option(:google_api_key) do
      nil
    end

    # Latitude value to display in the map if the latitude attribute is nil
    # (Otherwise the location defaults to (0,0) which is in the Gulf of Guinea
    register_instance_option(:default_latitude) do
      51.5 # Latitude of London, United Kingdom
    end

    # Longitude value to display if the longitude attribute is nil
    register_instance_option(:default_longitude) do
      -0.126 # Longitude of London, United Kingdom
    end

    # Default zoom level of the map
    register_instance_option(:default_zoom_level) do
      8
    end

    def dom_name
      @dom_name ||= "#{bindings[:form].object_name}_#{@name}_#{longitude_field}"
    end

    def latitude_dom_name
      @lat_dom_name ||= "#{bindings[:form].object_name}_#{@name}"
    end

    def longitude_dom_name
      @lon_dom_name ||= "#{bindings[:form].object_name}_#{longitude_field}"
    end

    def latitude_of_object
      bindings[:object].send(name)
    end

    def longitude_of_object
      bindings[:object].send(longitude_field)
    end

    [ :latitude, :longitude ].each do | attribute |
      eval <<-DEF
        def #{ attribute }_on_init
          #{ attribute }_of_object || default_#{ attribute }
        end
      DEF
    end

    def has_coordinates?
      [ latitude_of_object, longitude_of_object ].all?(&:present?)
    end
  end
end
