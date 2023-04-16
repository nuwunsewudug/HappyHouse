<template>
  <v-card v-if="house" max-width="375" class="mx-auto">
    <v-img
      gradient="to top right, rgba(100,115,201,.33),rgba(25,32,72,.7)"
      src="@/assets/apt.png"
      height="300px"
      dark
    >
      <v-row class="fill-height">
        <v-card-title class="white--text pl-12 pt-12">
          <div class="text-h4">{{ house.아파트 }}</div>
        </v-card-title>
      </v-row>
    </v-img>

    <v-list two-line>
      <v-list-item>
        <v-list-item-icon>
          <v-icon color="indigo"> mdi-map-marker </v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>{{ house.법정동 }} </v-list-item-title>
          <v-list-item-subtitle>법정동 위치</v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-list-item>
        <!-- <v-list-item-action></v-list-item-action> -->
        <v-list-item-icon>
          <v-icon color="indigo"> mdi-currency-usd </v-icon>
        </v-list-item-icon>
        <v-list-item-content>
          <v-list-item-title
            >{{
              (parseInt(house.거래금액.replace(",", "")) * 10000) | price
            }}원</v-list-item-title
          >
          <v-list-item-subtitle>거래 금액</v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-divider inset></v-divider>

      <v-list-item>
        <v-list-item-icon>
          <v-icon color="indigo"> mdi-office-building-marker </v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>{{ house.층 }}층</v-list-item-title>
          <v-list-item-subtitle>floor</v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-divider inset></v-divider>

      <v-list-item>
        <v-list-item-icon>
          <v-icon color="indigo" @click="sendEmail"> mdi-email</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>해당 매물 정보 메일로 받기</v-list-item-title>
          <v-list-item-subtitle
            >Receive sales information by mail</v-list-item-subtitle
          >
        </v-list-item-content>
      </v-list-item>
    </v-list>
  </v-card>
</template>

<script>
import { mapState } from "vuex";
// import emailjs from "emailjs-com";
import http from "@/util/http-common.js";

const memberStore = "memberStore";

export default {
  data() {
    return {
      myEmail: "",
    };
  },
  name: "HouseDetail",
  computed: {
    ...mapState(["house"]),
    ...mapState(memberStore, ["userInfo"]),
    // house() {
    //   return this.$store.state.house;
    // },
  },
  created() {
    console.log(this.userInfo);
    http.get("/member/" + this.userInfo).then(({ data }) => {
      console.log(data);
      this.myEmail = data.Member.user_email;
    });
  },
  filters: {
    price(value) {
      if (!value) return value;
      return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
  },

  methods: {
    // sendEmail() {
    //   var templateParams = {
    //     name: "{{ house.아파트 }}",
    //     notes: "Check this out!",
    //   };
    //   const YOUR_SERVICE_ID = "service_f6k5c7w";
    //   const YOUR_TEMPLATE_ID = "template_nl5mzsl";

    //   emailjs
    //     .send(
    //       YOUR_SERVICE_ID,
    //       YOUR_TEMPLATE_ID,
    //       templateParams,
    //       "U0TENfbFJ1ofsHvRm",
    //     )
    //     .then(
    //       function (response) {
    //         console.log("SUCCESS!", response.status, response.text);
    //       },
    //       function (error) {
    //         console.log("FAILED...", error);
    //       },
    //     );

    //   console.log("뿡");
    // },
    sendEmail() {
      console.log(this.myEmail);

      http
        .post("/mail", {
          address: this.myEmail, //user 이메일 주소로 바꾸기
          title: "해피하우스에서 매물 거래 정보를 보내 드립니다.",
          message: ` 
          안녕하세요 ${this.useInfo}님!
          매물 거래 정보 보내드립니다 ^.^
          아파트명 : ${this.house.아파트},
          위치 : ${this.house.법정동},
          거래금액 : ${this.house.거래금액}0,000원`,
        })
        .then(({ data }) => {
          alert("이메일이 전송되었습니다!");
          console.log(data);
        })
        .catch((error) => {
          alert("이메일이 전송되었습니다!");
          console.log(error);
        });
    },
  },
};
</script>

<style></style>
