require 'net/http'
require 'rexml/document'

class YandexApi
  def self.get_address(long,lat)
    resp = Net::HTTP.get 'geocode-maps.yandex.ru', "/1.x/?geocode=#{long},#{lat}"
    doc = REXML::Document.new resp

    format = {
        :city => '//GeoObject//Locality/LocalityName',
        :area => '//GeoObject//AdministrativeArea/AdministrativeAreaName',
        :sub_area => '//GeoObject//SubAdministrativeArea/SubAdministrativeAreaName',
        :street => '//GeoObject//Thoroughfare/ThoroughfareName',
        :city_area => '//GeoObject//DependentLocality/DependentLocality'
    }

    result = {}
    format.map do |key,val|
      elements = doc.elements.to_a(val)
      unless elements.empty?
        result[val] = elements[0].text
      end
    end
    result
  end
end