<template>
  <div>
    <v-card class="mx-auto rounded-xl" elevation="5" max-width="434" tile>
      <v-img height="100%" src="@/assets/userPage.png"></v-img>
      <v-col>
        <v-avatar size="100" style="position: absolute; top: 130px">
          <v-img src="@/assets/user.png"></v-img>
        </v-avatar>
      </v-col>
      <v-card-text>
        <div class="titletext">{{ userInfo }} 님 반갑습니다</div>
        <div class="subtitletext">해피하우스 사용자</div>
      </v-card-text>
      <v-card-text>
        <div>email : {{ myEmail }}</div>

        <div>관심 지역 : {{ myDong }}</div>

        <div>관심 주제 : 매매, 수도권</div>
      </v-card-text>
      <v-card-actions class="d-flex justify-end mb-10">
        <v-btn class="mb-5 mr-2 rounded-xl" color="#eceff1"
          ><router-link :to="'/modify'" class="btn corbtn">수정</router-link>
        </v-btn>
        <v-btn
          class="mb-5 mr-3 rounded-xl"
          color="#B71C1C"
          @click="deleteMyData"
          >탈퇴하기</v-btn
        >
      </v-card-actions>
    </v-card>
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";
import http from "@/util/http-common.js";
import router from "@/router";

const memberStore = "memberStore";

export default {
  name: "MemberMyPage",
  components: {},
  data: function () {
    return {
      myEmail: "",
      myDong: "",
    };
  },
  computed: {
    ...mapState(memberStore, ["userInfo"]),
  },
  created() {
    console.log(this.userInfo);

    http.get("/member/" + this.userInfo).then(({ data }) => {
      console.log(data);
      this.myEmail = data.Member.user_email;
      this.myDong = data.Member.my_dong_code;
    });
  },
  methods: {
    ...mapActions(memberStore, ["getLogout"]),
    deleteMyData() {
      http.delete("/member/" + this.userInfo).then(({ data }) => {
        console.log(data);
        alert("삭제완료");
        router.push({ name: "home" });
        this.getLogout();
      });
    },
  },
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap");

* {
  font-family: "Noto Sans KR", sans-serif;
}

.titletext {
  font-family: "Noto Sans KR", sans-serif;
  font-size: 30px;
  font-weight: bold;
}

.subtitletext {
  margin-top: 10px;
}
</style>
