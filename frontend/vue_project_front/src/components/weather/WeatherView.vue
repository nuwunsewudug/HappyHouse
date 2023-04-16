<template>
  <div>
    <v-container>
      <v-row>
        <v-col
          class="cardsubText d-flex align-center justify-center mb-6"
          cols="7"
          ><h1>현재 날씨 🌐</h1></v-col
        >
        <v-col cols="5">
          <v-card
            elevation="5"
            class="mx-auto rounded-xl mb-10"
            max-width="550"
          >
            <v-card-text>
              <div>오늘 기상 정보</div>
            </v-card-text>
            <v-divider></v-divider>
            <v-list-item two-line>
              <v-list-item-content>
                <v-list-item-title class="text-h5">
                  {{ weatherData.name }}</v-list-item-title
                >
                <v-list-item-subtitle>{{
                  weatherData.weather[0].main
                }}</v-list-item-subtitle>
                <v-list-item-subtitle></v-list-item-subtitle>
              </v-list-item-content>
            </v-list-item>

            <v-card-text>
              <v-row align="center">
                <v-col class="text-h2" cols="8">
                  {{ (weatherData.main.feels_like - 273) | tempFormat }} &deg;C
                </v-col>
                <v-col cols="4">
                  <v-img
                    :src="weatherData.weather[0].icon | imgFormat"
                    alt="Sunny image"
                    width="92"
                  ></v-img>
                </v-col>
              </v-row>
            </v-card-text>

            <v-list-item>
              <v-list-item-icon>
                <v-icon>mdi-send</v-icon>
              </v-list-item-icon>
              <v-list-item-subtitle
                >{{ weatherData.wind.speed }} km/h</v-list-item-subtitle
              >
            </v-list-item>

            <v-list-item>
              <v-list-item-icon>
                <v-icon>mdi-cloud-download</v-icon>
              </v-list-item-icon>
              <v-list-item-subtitle
                >{{ weatherData.main.humidity }}%</v-list-item-subtitle
              >
            </v-list-item>
          </v-card></v-col
        ></v-row
      >
    </v-container>
  </div>
</template>

<script>
//import http from "@/util/http-common.js";
import Vue from "vue";
import VueGeolocationApi from "vue-geolocation-api";
import axios from "axios";

Vue.use(VueGeolocationApi);

export default {
  data() {
    return { latitude: "", longitude: "", textContent: "", weatherData: [] };
  },
  created() {
    // if (!("geolocation" in navigator)) {
    //   this.textContent = "Geolocation is not available.";
    //   return;
    // }
    this.textContent = "Locating...";

    // get position
    navigator.geolocation.getCurrentPosition(
      (pos) => {
        this.latitude = pos.coords.latitude;
        this.longitude = pos.coords.longitude;
        this.getWeather(this.latitude, this.longitude);
      },
      (err) => {
        this.textContent = err.message;
      },
    );
    console.log(this.latitude, this.longitude);
    // this.getWeather(this.latitude, this.longitude);
  },
  methods: {
    getWeather(lat, lng) {
      console.log(lat, lng);
      axios
        .get(
          "https://api.openweathermap.org/data/2.5/weather?lat=" +
            lat +
            "&lon=" +
            lng +
            "&appid=72eff09e84e2cbe56acc1c783a9c22bb",
        )
        .then(({ data }) => {
          this.weatherData = data;
          console.log(data);
        });
    },
  },
  filters: {
    tempFormat(val) {
      return val.toString().substring(0, 5);
    },
    imgFormat(val) {
      return "http://openweathermap.org/img/w/" + val + ".png";
    },
  },
};
</script>

<style></style>
