<template>
  <div class="dashboard">
    <div class="container">
      <h2 class="text-center headtext"><b>부동산 타임</b></h2>
    </div>
    <v-subheader class="py-0 d-flex justify-space-between rounded-lg">
    </v-subheader>
    <v-container class="fill-height" fluid>
      <house-search-bar></house-search-bar>
    </v-container>
    <h3></h3>

    <v-row justify="end">
      <!-- 부타 글쓰기  -->
      <v-dialog v-model="dialog" persistent max-width="600px">
        <template v-slot:activator="{ attrs }">
          <v-btn
            class="rounded-pill mr-14"
            color="indigo"
            dark
            v-bind="attrs"
            @click="checkUserloc()"
          >
            글쓰러 가기
          </v-btn>
        </template>
        <v-card>
          <v-card-title>
            <v-img height="80" src="@/assets/bootawrite.png"></v-img>
            <span class="text-h5">부동산타임 글쓰기 </span>
          </v-card-title>
          <v-card-text>
            <v-row>
              <v-col cols="12" sm="12" md="6">
                <v-text-field
                  v-model="btb_title"
                  id="btb_title"
                  name="btb_title"
                  ref="btb_title"
                  label="제목"
                  required
                ></v-text-field>
              </v-col>
              <v-col cols="12" sm="12" md="6"> </v-col>
              <v-col cols="12" sm="12" md="12">
                <v-textarea
                  auto-grow
                  filled
                  label="내용"
                  id="btb_content"
                  name="btb_content"
                  placeholder="내용을 입력하세요"
                  v-model="btb_content"
                ></v-textarea>
              </v-col>

              <v-col rows="3" cols="12" md="6">
                <v-text-field
                  label="Password*"
                  type="password"
                  name="btb_pw"
                  id="btb_pw"
                  v-model="btb_pw"
                  required
                ></v-text-field>
              </v-col>

              <v-col cols="12" sm="6">
                <v-autocomplete
                  :items="[
                    '서울',
                    '수도권',
                    '지방',
                    '아파트',
                    '매매',
                    '행복주택',
                    '귀농',
                    '주식',
                    '코인',
                  ]"
                  label="관심"
                  multiple
                ></v-autocomplete>
              </v-col>
            </v-row>

            <small>*삭제시 비밀번호가 필요합니다</small>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" text @click="dialog = false">
              안쓸래요
            </v-btn>
            <v-btn color="blue darken-1" text @click="updateBoota()">
              올리기
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>

      <!-- 부타 글쓰기 end -->
    </v-row>
    <br />
    <v-row class="ma-5" max-width="90%">
      <v-col lg="7" cols="12">
        <v-alert border="right" :type="types" elevation="3" outlined>
          <div>
            <button @click="getAuth">우리 동네 인증하기</button>
            <p>{{ textContent }}</p>
          </div>
        </v-alert>

        <v-row>
          <v-col lg="6" cols="12">
            <v-card elevation="2" class="rounded-lg" height="300px">
              <v-card-text class="d-flex justify-space-between align-center">
                <div v-if="houseOne">
                  <strong>Hot 매물 🔥 </strong> <br />
                  <span>지금 가장 인기있는 매물입니다</span>
                  <div>
                    <p class="text-h6 text--primary mt-4 font-weight-bold">
                      {{ houseOne.아파트 }}
                    </p>

                    <div>건축년도 : {{ houseOne.건축년도 }}</div>
                    <div>
                      소재지 : {{ houseOne.중개사소재지 }} {{ houseOne.법정동 }}
                    </div>

                    <div>거래금액 : {{ houseOne.거래금액 }},000원</div>
                    <div>평점 : {{ hotHouse.reivew_rating }}</div>
                  </div>
                </div>
                <div v-if="!houseOne" class="d-flex justify-center">
                  <v-row>
                    <v-col cols="12">
                      <h2 class="ma-5">지역 내 인기매물이 없습니다.</h2>
                    </v-col>
                  </v-row>
                  <v-row>
                    <v-col cols="12">
                      <img src="@/assets/noboard2.png" alt="" />
                    </v-col>
                  </v-row>
                </div>
              </v-card-text>
              <v-card-actions class="d-flex justify-space-between">
              </v-card-actions>
            </v-card>
          </v-col>
          <v-col lg="6" cols="12">
            <v-card elevation="2" class="rounded-lg" height="300px">
              <v-card-text class="d-flex justify-space-between align-center">
                <div v-if="BoardOne">
                  <strong>Hot 게시글 🔥</strong> <br />
                  <span>지금 가장 핫한 게시글입니다</span>
                  <div>
                    <p
                      @click="movePage(BoardOne.btbno)"
                      class="text-h6 text--primary mt-4 font-weight-bold"
                    >
                      <v-btn>{{ BoardOne.btb_title }}</v-btn>
                    </p>
                    <div>좋아요 : {{ BoardOne.like_count }}</div>
                    <div>조회수 : {{ BoardOne.btb_read_count }}</div>
                    <div>내용 : {{ BoardOne.btb_content }}</div>
                    <div>등록일 : {{ BoardOne.btb_write_date }}</div>
                  </div>
                </div>

                <div v-if="!BoardOne" class="d-flex justify-center">
                  <v-row>
                    <v-col cols="12">
                      <h2 class="mt-5 ml-4">지역 내 인기게시글이 없습니다.</h2>
                    </v-col>
                  </v-row>
                  <v-row>
                    <v-col cols="12">
                      <img src="@/assets/noboard2.png" alt="" />
                    </v-col>
                  </v-row>
                </div>
              </v-card-text>
              <v-card-actions class="d-flex justify-space-between">
              </v-card-actions>
            </v-card>
          </v-col>
        </v-row>
      </v-col>
      <v-col cols="12" lg="5">
        <v-card class="rounded-lg" height="415px">
          <v-card-text class="menuTitle font-weight-bold pt-10 pl-10 mb-15"
            >우리동네 게시판</v-card-text
          >

          <v-timeline dense>
            <v-timeline-item color="indigo" small>
              <strong>자유 게시판</strong>
              <div class="text-caption">익명으로 자유롭게</div>
            </v-timeline-item>
            <v-timeline-item color="green" small>
              <strong>스크랩한 게시글 보기</strong>
              <div class="text-caption mb-2">
                스크랩한 게시글을 볼 수 있습니다
              </div>
            </v-timeline-item>

            <v-timeline-item color="indigo" small>
              <strong>정보 게시판</strong>
              <div class="text-caption">동네 정보 같이 공유해요</div>
            </v-timeline-item>
          </v-timeline>
        </v-card>
      </v-col>
      <v-col>
        <!-- 글 리스트 -->
        <component :is="whichStep"></component>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import http from "@/util/http-common.js";
import Vue from "vue";
import VueGeolocationApi from "vue-geolocation-api";
import HouseSearchBar from "@/components/house/HouseSearchBar.vue";
import axios from "axios";
import { mapState } from "vuex";

Vue.use(VueGeolocationApi);
const Kakao = axios.create({
  baseURL: "https://dapi.kakao.com", // 공통 요청 경로
  headers: {
    Authorization: "KakaoAK b004e076e4908b59d3812882c7779d61",
  },
});
export default {
  name: "BootaView",
  data() {
    return {
      dialog: false,
      btb_title: "",
      btb_pw: "",
      btb_content: "",
      latitude: "",
      longitude: "",
      textContent: "원하시는 동네를 먼저 선택해 주세요",
      nowloc: "",
      checkloc: "",
      active: 0,
      userLocauth: false,
      types: "info",
      houseOne: null,
      house: [],
      reivew: "",
      BoardOne: null,
    };
  },
  created() {
    navigator.geolocation.getCurrentPosition(
      (pos) => {
        this.latitude = pos.coords.latitude;
        this.longitude = pos.coords.longitude;

        console.log("created", this.latitude, this.longitude);
        this.alterGun(this.latitude, this.longitude);
      },
      (err) => {
        this.textContent = err.message;
      },
    );
    if (this.hotBoard) {
      this.$store.dispatch("getHotBoard");
    }
    if (this.hotHouse) {
      this.$store.dispatch("getHotHouse");
    }
  },

  methods: {
    movePage(btbno) {
      this.$router.push({ path: "/boota/detail/" + btbno });
    },
    getAuth() {
      // 우리 동네 인증하기 클릭시

      if (this.nowloc.length && this.nowloc == this.checkgugun) {
        this.userLocauth = true;
      } else {
        this.userLocauth = false;
      }

      console.log(this.userLocauth);
      if (this.userLocauth) {
        this.textContent = this.nowloc + " 인증되었습니다 ^.^";
        this.types = "success";
        this.$store.dispatch("getLocal", this.nowloc);
        this.$store.dispatch("getHotHouse");
        this.$store.dispatch("getHotBoard");
      } else {
        this.types = "error";
        this.textContent =
          "위치가 일치하지 않습니다. 활동에 제약이 생깁니다 ㅜ.ㅜ";
      }
    },
    async alterGun(lat, lng) {
      // 현재 위치 위도 경도로 구군 구함

      await Kakao.get(
        "/v2/local/geo/coord2regioncode.json?y=" + lat + "&x=" + lng,
      ).then(({ data }) => {
        this.nowloc = data.documents[0].region_2depth_name;
        console.log(this.nowloc);
      });
    },

    checkUserloc() {
      // 부동산 타임 글쓰기
      if (!this.userLocauth) {
        alert("동네 정보가 불일치 합니다 위치를 확인해주세요");
        this.dialog = false;
      } else {
        this.dialog = true;
      }
    },

    onButtonClick(item) {
      console.log("click on " + item.no);
    },
    updateBoota() {
      this.dialog = false;
      http
        .post("/boota", {
          btb_title: this.btb_title,
          btb_content: this.btb_content,
          btb_pw: this.btb_pw,
          guguncode: this.nowloc,
        })
        .then(({ data }) => {
          alert("등록이 완료되었습니다!");
          console.log(data);
        })
        .catch((error) => console.log(error));
    },
    moveList() {
      this.$router.push({ path: "/boota" });
    },

    hotHousegetter() {
      for (var i = 0; i < 10; i++) {
        this.house = this.houses[i];
        if (this.house.일련번호 == this.hotHouse.house_num) {
          this.houseOne = this.house;
          console.log(this.houseOne);
          return;
        }
      }
    },
  },
  components: {
    HouseSearchBar,
    BootaBoardView: () => import("@/components/boota/BootaBoardView.vue"),
    //다른 게시판 만들고 채우기
  },
  computed: {
    ...mapState(["houses", "hotHouse", "hotBoard"]),
    whichStep() {
      switch (this.active) {
        case 0:
          return "BootaBoardView";
        case 1:
          return "BootaBoardView";
        default:
          return "BootaBoardView";
      }
    },
    checkgugun() {
      return this.$store.state.map_gugunName;
    },
    checkHotHouse() {
      return this.hotHouse;
    },
    checkHotBoard() {
      return this.hotBoard;
    },
  },
  watch: {
    checkgugun(val) {
      this.checkloc = val;
    },
    checkDialog(val) {
      this.userLocauth = val;
    },
    checkHotHouse() {
      this.hotHousegetter();
    },
    checkHotBoard(val) {
      this.BoardOne = val;
    },
  },
};
</script>

<style scoped>
.overlap-icon {
  position: absolute;
  top: -33px;
  text-align: center;
  padding-top: 12px;
}

.container {
  max-width: 50%;
}

.headtext {
  font-size: 50px;
}

.menuTitle {
  font-size: 25px;
}
</style>
