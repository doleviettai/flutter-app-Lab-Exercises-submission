/// WeatherModel helper interpreting temperature and condition codes into icons & messages.
class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩️';
    } else if (condition < 400) {
      return '🌧️';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫️';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🌈';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Thời tiết lý tưởng để thưởng thức kem mát lạnh 🍦';
    } else if (temp > 20) {
      return 'Thời tiết rất đẹp để mặc áo thun dạo phố 👕';
    } else if (temp < 15) {
      return 'Trời se lạnh, bạn nên mặc thêm áo ấm và quàng khăn 🧣';
    } else {
      return 'Hãy nhớ mang theo một chiếc áo khoác nhẹ nhé 🧥';
    }
  }
}