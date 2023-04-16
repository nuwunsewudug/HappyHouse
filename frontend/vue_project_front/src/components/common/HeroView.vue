<template>
  <v-app>
    <v-container class="pt-5">
      <v-row class="mb-15">
        <v-col lg="6">
          <h1 class="intro-text">
            <span class="intro-btext">집,</span>
            구하세요?
          </h1>
          <h2 class="intro-textsub">HappyHouse 가 도와드릴게요!</h2>

          <p class="description">
            페어 4팀 유영진(가짜팀장) 김태훈(진짜팀장)의 프로젝트입니다. 부동산
            매물 거래 내역을 볼 수 있구요, <br />
            인증된 동네 사람들끼리만 커뮤니티 활동도 가능하답니다. 짱
          </p>
          <v-btn
            @click="movePage"
            color="#4657FF"
            class="white--text mr-10"
            rounded
          >
            매물찾기</v-btn
          >
          <v-btn color="#4657FF" @click="downBtn" class="white--text" rounded>
            오늘의 정보 보기
            <v-icon class="ml-1">mdi-arrow-down-thin</v-icon>
            click!</v-btn
          ></v-col
        >
        <v-col lg="6"> <img width="100%" src="@/assets/main.png" /> </v-col>
      </v-row>
    </v-container>
    <v-carousel hide-delimiters cycle id="downBtn">
      <v-carousel-item
        gradient="to top , rgba(00,115,201,.10),rgba(25,32,72,.5)"
        v-for="(item, i) in items"
        :key="i"
        :src="item.src"
      >
        <v-container fill-height fluid pa-0 ma-0 pb-3>
          <v-layout fill-height align-end pb-4 mb-4>
            <v-row class="fill-height" align="center" justify="center">
              <div class="text-h2 white--text">{{ item.title }}</div>
            </v-row>
            <v-row class="fill-height" align="center" justify="center">
              <div class="text-h5 white--text">{{ item.sub }}</div>
            </v-row>
          </v-layout>
        </v-container>
      </v-carousel-item>
    </v-carousel>
  </v-app>
</template>
<script>
export default {
  data() {
    return {
      items: [
        {
          src: require("@/assets/homecar1.png"),
          title: "매물 찾기",
          sub: "주변 상권까지 한눈에",
        },
        {
          src: require("@/assets/homecar2.png"),
          title: "Q&A",
          sub: "궁금증  해소하기",
        },
        {
          src: require("@/assets/homecar3.png"),
          title: "익명으로 솔직하게",
          sub: "  부동산 타임에서 부동산에 대한 이야기를 나눠보세요",
        },
      ],
    };
  },
  methods: {
    downBtn() {
      console.log("이동");
      var location = document.querySelector("#downBtn").offsetTop;
      //document.getElementById("downBtn").scrollIntoView(true);

      window.scrollTo({ top: location, behavior: "smooth" });
    },
    movePage() {
      this.$router.push({ path: "/house" });
    },
  },
  name: "HeroView",
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap");

* {
  font-family: "Noto Sans KR", sans-serif;
}

.link {
  text-decoration: none;
  color: #707070;
}
.intro-text {
  margin-top: 100px;
  font-size: 60px;
  font-weight: bold;
  color: #444;
}
.intro-btext {
  color: #4657ff;
  font-size: 70px;
  font-weight: bolder;
}
.intro-textsub {
  font-size: 60px;
  font-weight: bold;
  color: #444;
}
.description {
  font-size: 19px;
  margin: 32px 0px;
  color: #444444ba;
}
</style>
