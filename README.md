# Global-Transportation
Analysis of global airports, train stations, and ferry ports. Sources: OpenFlights airports database and OurAirports database

# Source information:
https://ourairports.com/airports.html

# OurAirports dataset formats
This page documents the columns used in the open-data datasets described on the Downloads page. There is more information there about using the data, including terms of use, and working around Microsoft Excel's UTF-8 handling for CSV files.

All of the following datasets use the comma-separated values (CSV) format, and UTF-8 character encoding.

# Dataset: airports.csv
Each row in this dataset represents the record for a single airport. The primary key for interoperability purposes with other datasets is ident, but the actual internal OurAirports primary key is id. iso_region is a foreign key into the regions.csv download file.

# Column	Sample value	Description
id 2434	Internal OurAirports integer identifier for the airport. This will stay persistent, even if the airport code changes.
ident	EGLL	The text identifier used in the OurAirports URL. This will be the ICAO code if available. Otherwise, it will be a local airport code (if no conflict), or if nothing else is available, an internally-generated code starting with the ISO2 country code, followed by a dash and a four-digit number.
type	large_airport	The type of the airport. Allowed values are "closed_airport", "heliport", "large_airport", "medium_airport", "seaplane_base", and "small_airport". See the map legend for a definition of each type.
name	London Heathrow Airport	The official airport name, including "Airport", "Airstrip", etc.
latitude_deg	51.470600	The airport latitude in decimal degrees (positive for north).
longitude_deg	-0.461941	The airport longitude in decimal degrees (positive for east).
elevation_ft	83	The airport elevation MSL in feet (not metres).
continent	EU	The code for the continent where the airport is (primarily) located. Allowed values are "AF" (Africa), "AN" (Antarctica), "AS" (Asia), "EU" (Europe), "NA" (North America), "OC" (Oceania), or "SA" (South America).
iso_country	GB	The two-character ISO 3166:1-alpha2 code for the country where the airport is (primarily) located. A handful of unofficial, non-ISO codes are also in use, such as "XK" for Kosovo. Points to the code column in countries.csv.
iso_region	GB-ENG	An alphanumeric code for the high-level administrative subdivision of a country where the airport is primarily located (e.g. province, governorate), prefixed by the ISO2 country code and a hyphen. OurAirports uses ISO 3166:2 codes whenever possible, preferring higher administrative levels, but also includes some custom codes. See the documentation for regions.csv.
municipality	London	The primary municipality that the airport serves (when available). Note that this is not necessarily the municipality where the airport is physically located.
scheduled_service	yes	"yes" if the airport currently has scheduled airline service; "no" otherwise.
gps_code	EGLL	The code that an aviation GPS database (such as Jeppesen's or Garmin's) would normally use for the airport. This will always be the ICAO code if one exists. Note that, unlike the ident column, this is not guaranteed to be globally unique.
iata_code	LHR	The three-letter IATA code for the airport (if it has one).
local_code		The local country code for the airport, if different from the gps_code and iata_code fields (used mainly for US airports).
home_link	http://www.heathrowairport.com/	URL of the airport's official home page on the web, if one exists.
wikipedia_link	https://en.wikipedia.org/wiki/Heathrow_Airport	URL of the airport's page on Wikipedia, if one exists.
keywords	LON, Londres	Extra keywords/phrases to assist with search, comma-separated. May include former names for the airport, alternate codes, names in other languages, nearby tourist destinations, etc.

# Dataset: countries.csv
Each row represents a country or country-like entity (e.g. Hong Kong). The iso_country column in airports.csv, navaids.csv, and regions.csv refer to the code column here.

# Column	Sample value	Description
id	302791	Internal OurAirports integer identifier for the country. This will stay persistent, even if the country name or code changes.
code	BR	The two-character ISO 3166:1-alpha2 code for the country. A handful of unofficial, non-ISO codes are also in use, such as "XK" for Kosovo. The iso_country field in airports.csv points into this column.
name	Brazil	The common English-language name for the country. Other variations of the name may appear in the keywords field to assist with search.
continent	SA	The code for the continent where the country is (primarily) located. See the continent code in airports.csv for allowed values.
wikipedia_link	https://en.wikipedia.org/wiki/Brazil	Link to the Wikipedia article about the country.
keywords	Brasil, Brasilian	A comma-separated list of search keywords/phrases related to the country.

# Data Dictionary
Large airport 	Large airport	Land airport with scheduled major airline service with millions of passengers/year, or major military base).
Medium airport 	Medium airport	Land airport with scheduled regional airline service, or regular general aviation or military traffic.
Small airport 	Small airport	Land airport with little or no scheduled service, light general aviation traffic.
Heliport 		Heliport		Helicopter pad(s) with no runways available for fixed-wing aircraft.
Seaplane base 	Seaplane base	Docking/fueling area for seaplanes, with no facilities for land aircraft.
Closed airport 	Closed		Any type of airport that's no longer operational.

# Source information:
https://openflights.org/data.html

As of January 2017, the OpenFlights Airports Database contains over 10,000 airports, train stations and ferry terminals spanning the globe. Each entry contains the following information:

Airport ID	Unique OpenFlights identifier for this airport.
Name	Name of airport. May or may not contain the City name.
City	Main city served by airport. May be spelled differently from Name.
Country	Country or territory where airport is located. See Countries to cross-reference to ISO 3166-1 codes.
IATA	3-letter IATA code. Null if not assigned/unknown.
ICAO	4-letter ICAO code.
Null if not assigned.
Latitude	Decimal degrees, usually to six significant digits. Negative is South, positive is North.
Longitude	Decimal degrees, usually to six significant digits. Negative is West, positive is East.
Altitude	In feet.
Timezone	Hours offset from UTC. Fractional hours are expressed as decimals, eg. India is 5.5.
DST	Daylight savings time. One of E (Europe), A (US/Canada), S (South America), O (Australia), Z (New Zealand), N (None) or U (Unknown). See also: Help: Time
Tz database time zone	Timezone in "tz" (Olson) format, eg. "America/Los_Angeles".
Type	Type of the airport. Value "airport" for air terminals, "station" for train stations, "port" for ferry terminals and "unknown" if not known. In airports.csv, only type=airport is included.
Source	Source of this data. "OurAirports" for data sourced from OurAirports, "Legacy" for old data not matched to OurAirports (mostly DAFIF), "User" for unverified user contributions. In airports.csv, only source=OurAirports is included.
The data is UTF-8 encoded.
