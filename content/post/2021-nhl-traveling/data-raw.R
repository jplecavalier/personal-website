library(data.table)

venues <- rbindlist(list(
  list(team="ANA", venue_name="Honda Center", venue_lat=33.807778, venue_long=-117.876667),
  list(team="ARI", venue_name="Gila River Arena", venue_lat=33.531944, venue_long=-112.261111),
  list(team="BOS", venue_name="TD Garden", venue_lat=42.366303, venue_long=-71.062228),
  list(team="BUF", venue_name="KeyBank Center", venue_lat=42.875, venue_long=-78.876389),
  list(team="CAR", venue_name="PNC Arena", venue_lat=35.803333, venue_long=-78.721944),
  list(team="CBJ", venue_name="Nationwide Arena", venue_lat=39.969283, venue_long=-83.006111),
  list(team="CGY", venue_name="Scotiabank Saddledome", venue_lat=51.0375, venue_long=-114.051944),
  list(team="CHI", venue_name="United Center", venue_lat=41.880556, venue_long=-87.674167),
  list(team="COL", venue_name="Ball Arena", venue_lat=39.748611, venue_long=-105.0075),
  list(team="DAL", venue_name="American Airlines Center", venue_lat=32.790556, venue_long=-96.810278),
  list(team="DET", venue_name="Little Caesars Arena", venue_lat=42.341111, venue_long=-83.055),
  list(team="EDM", venue_name="Rogers Place", venue_lat=53.546944, venue_long=-113.497778),
  list(team="FLA", venue_name="BB&T Center", venue_lat=26.158333, venue_long=-80.325556),
  list(team="LAK", venue_name="STAPLES Center", venue_lat=34.043056, venue_long=-118.267222),
  list(team="MIN", venue_name="Xcel Energy Center", venue_lat=44.944722, venue_long=-93.101111),
  list(team="MTL", venue_name="Bell Centre", venue_lat=45.496111, venue_long=-73.569444),
  list(team="NJD", venue_name="Prudential Center", venue_lat=40.733611, venue_long=-74.171111),
  list(team="NSH", venue_name="Bridgestone Arena", venue_lat=36.159167, venue_long=-86.778611),
  list(team="NYI", venue_name="Nassau Coliseum", venue_lat=40.722778, venue_long=-73.590556),
  list(team="NYR", venue_name="Madison Square Garden", venue_lat=40.750556, venue_long=-73.993611),
  list(team="OTT", venue_name="Canadian Tire Centre", venue_lat=45.296944, venue_long=-75.927222),
  list(team="PHI", venue_name="Wells Fargo Center", venue_lat=39.901111, venue_long=-75.171944),
  list(team="PIT", venue_name="PPG Paints Arena", venue_lat=40.439444, venue_long=-79.989167),
  list(team="SJS", venue_name="SAP Center at San Jose", venue_lat=37.332778, venue_long=-121.901111),
  list(team="STL", venue_name="Enterprise Center", venue_lat=38.626667, venue_long=-90.2025),
  list(team="TBL", venue_name="AMALIE Arena", venue_lat=27.942778, venue_long=-82.451944),
  list(team="TOR", venue_name="Scotiabank Arena", venue_lat=43.643333, venue_long=-79.379167),
  list(team="VAN", venue_name="Rogers Arena", venue_lat=49.277778, venue_long=-123.108889),
  list(team="VGK", venue_name="T-Mobile Arena", venue_lat=36.102778, venue_long=-115.178333),
  list(team="WPG", venue_name="Bell MTS Place", venue_lat=49.892778, venue_long=-97.143611),
  list(team="WSH", venue_name="Capital One Arena", venue_lat=38.898056, venue_long=-77.020833)
))

fwrite(venues, "content/post/2021-nhl-traveling/data/venues.csvy", yaml=TRUE)
