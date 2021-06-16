require 'rails_helper'

RSpec.describe "current weather poro", type: :model do
  it 'should return a forecast object with correct attributes' do
    data = {
    "lat": 39.7385,
    "lon": -104.9849,
    "timezone": "America/Denver",
    "timezone_offset": -21600,
    "current": {
        "dt": 1623820657,
        "sunrise": 1623756687,
        "sunset": 1623810579,
        "temp": 298.47,
        "feels_like": 298.02,
        "pressure": 1011,
        "humidity": 37,
        "dew_point": 282.75,
        "uvi": 0,
        "clouds": 56,
        "visibility": 10000,
        "wind_speed": 0.45,
        "wind_deg": 281,
        "wind_gust": 1.79,
        "weather": [
            {
                "id": 803,
                "main": "Clouds",
                "description": "broken clouds",
                "icon": "04n"
            }
        ]
    },
    "hourly": [
        {
            "dt": 1623819600,
            "temp": 298.47,
            "feels_like": 298.02,
            "pressure": 1011,
            "humidity": 37,
            "dew_point": 282.75,
            "uvi": 0,
            "clouds": 56,
            "visibility": 10000,
            "wind_speed": 2.63,
            "wind_deg": 206,
            "wind_gust": 4.52,
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623823200,
            "temp": 298.76,
            "feels_like": 298.26,
            "pressure": 1011,
            "humidity": 34,
            "dew_point": 281.75,
            "uvi": 0,
            "clouds": 54,
            "visibility": 10000,
            "wind_speed": 2.84,
            "wind_deg": 202,
            "wind_gust": 4.61,
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623826800,
            "temp": 298.67,
            "feels_like": 298.11,
            "pressure": 1012,
            "humidity": 32,
            "dew_point": 280.78,
            "uvi": 0,
            "clouds": 36,
            "visibility": 10000,
            "wind_speed": 2.92,
            "wind_deg": 206,
            "wind_gust": 4.76,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623830400,
            "temp": 298.36,
            "feels_like": 297.72,
            "pressure": 1012,
            "humidity": 30,
            "dew_point": 279.57,
            "uvi": 0,
            "clouds": 39,
            "visibility": 10000,
            "wind_speed": 3.26,
            "wind_deg": 205,
            "wind_gust": 5.56,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623834000,
            "temp": 297.95,
            "feels_like": 297.24,
            "pressure": 1013,
            "humidity": 29,
            "dew_point": 278.73,
            "uvi": 0,
            "clouds": 49,
            "visibility": 10000,
            "wind_speed": 3.13,
            "wind_deg": 220,
            "wind_gust": 6.05,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623837600,
            "temp": 297.34,
            "feels_like": 296.57,
            "pressure": 1013,
            "humidity": 29,
            "dew_point": 277.84,
            "uvi": 0,
            "clouds": 40,
            "visibility": 10000,
            "wind_speed": 2.63,
            "wind_deg": 216,
            "wind_gust": 4.36,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623841200,
            "temp": 296.95,
            "feels_like": 296.12,
            "pressure": 1013,
            "humidity": 28,
            "dew_point": 277.25,
            "uvi": 0,
            "clouds": 36,
            "visibility": 10000,
            "wind_speed": 2.13,
            "wind_deg": 214,
            "wind_gust": 2.51,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623844800,
            "temp": 296.65,
            "feels_like": 295.79,
            "pressure": 1013,
            "humidity": 28,
            "dew_point": 276.84,
            "uvi": 0,
            "clouds": 33,
            "visibility": 10000,
            "wind_speed": 1.02,
            "wind_deg": 197,
            "wind_gust": 1.15,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623848400,
            "temp": 298.16,
            "feels_like": 297.4,
            "pressure": 1014,
            "humidity": 26,
            "dew_point": 276.91,
            "uvi": 0.53,
            "clouds": 18,
            "visibility": 10000,
            "wind_speed": 0.5,
            "wind_deg": 227,
            "wind_gust": 0.76,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "pop": 0
        }
      ],
      "daily": [
        {
            "dt": 1623783600,
            "sunrise": 1623756687,
            "sunset": 1623810579,
            "moonrise": 1623773580,
            "moonset": 1623737100,
            "moon_phase": 0.17,
            "temp": {
                "day": 309.54,
                "min": 295.87,
                "max": 311.13,
                "night": 298.47,
                "eve": 305.28,
                "morn": 297.19
            },
            "feels_like": {
                "day": 306.94,
                "night": 298.02,
                "eve": 303.31,
                "morn": 296.51
            },
            "pressure": 1010,
            "humidity": 13,
            "dew_point": 276.98,
            "wind_speed": 5.68,
            "wind_deg": 163,
            "wind_gust": 7.48,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 0,
            "pop": 0,
            "uvi": 11.67
        },
        {
            "dt": 1623870000,
            "sunrise": 1623843090,
            "sunset": 1623897001,
            "moonrise": 1623864000,
            "moonset": 1623825420,
            "moon_phase": 0.2,
            "temp": {
                "day": 309.97,
                "min": 296.65,
                "max": 309.97,
                "night": 297.9,
                "eve": 301.45,
                "morn": 298.16
            },
            "feels_like": {
                "day": 307.06,
                "night": 297.29,
                "eve": 300.33,
                "morn": 297.4
            },
            "pressure": 1010,
            "humidity": 9,
            "dew_point": 271.75,
            "wind_speed": 8.3,
            "wind_deg": 4,
            "wind_gust": 10.85,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": 100,
            "pop": 0.2,
            "uvi": 10.21
        },
        {
            "dt": 1623956400,
            "sunrise": 1623929495,
            "sunset": 1623983420,
            "moonrise": 1623954420,
            "moonset": 1623913620,
            "moon_phase": 0.25,
            "temp": {
                "day": 309.85,
                "min": 295.3,
                "max": 310.17,
                "night": 298.32,
                "eve": 302.22,
                "morn": 296.64
            },
            "feels_like": {
                "day": 306.96,
                "night": 297.78,
                "eve": 300.79,
                "morn": 295.85
            },
            "pressure": 1008,
            "humidity": 9,
            "dew_point": 272.32,
            "wind_speed": 8.35,
            "wind_deg": 210,
            "wind_gust": 11.25,
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": 35,
            "pop": 0.36,
            "rain": 0.11,
            "uvi": 10.13
        }
      ]
    }

    @weather = Weather.new(data)

    expect(@weather).to be_a(Weather)
    expect(@weather.id).to eq(nil)
    expect(@weather.current_weather.humidity).to eq(37)
    expect(@weather.hourly_weather[0].conditions).to eq("broken clouds")
    expect(@weather.daily_weather[1].max_temp).to eq(98.28)
  end
end
