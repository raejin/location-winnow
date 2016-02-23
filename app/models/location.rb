class Location < ActiveRecord::Base
  def nearby_locations
    Location.select("id,search_str, ST_Distance(ST_MakePoint(coords_long, coords_lat), ST_GeomFromText('POINT(#{coords_long} #{coords_lat})')) as dist").where("id != #{id}").order('dist asc').limit(5)
  end
end
