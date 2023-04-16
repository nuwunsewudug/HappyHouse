<template>
  <v-container class="fill-height" fluid>
    <v-row align="center" justify="center" dense>
      <v-col cols="12" sm="6" md="3" lg="3">
        <v-card elevation="0">
          <a
            href="https://edu-fedorae.netlify.app"
            name="Fedorae Education"
            title="Fedorae Education"
            target="_blank"
          >
            <v-img
              src="@/assets/join.png"
              alt="Fedorae Education Log"
              contain
              height="200"
            ></v-img>
          </a>
          <v-card-text>
            <v-form>
              <v-text-field
                label="아이디를 입력하세요"
                name="name"
                v-model="myId"
                prepend-inner-icon="mdi-account"
                type="text"
                class="rounded-xl"
                outlined
              ></v-text-field>
              <v-text-field
                label="이메일을 입력하세요"
                name="email"
                v-model="myEmail"
                prepend-inner-icon="mdi-email"
                type="email"
                class="rounded-xl"
                outlined
              ></v-text-field>
              <v-text-field
                label="비밀번호를 입력하세요"
                name="password"
                v-model="myPw"
                prepend-inner-icon="mdi-lock"
                type="password"
                class="rounded-xl"
                outlined
              ></v-text-field>
              <v-text-field
                label="비밀번호를 재입력하세요"
                name="password"
                v-model="rePw"
                prepend-inner-icon="mdi-lock-outline"
                type="password"
                class="rounded-xl"
                outlined
              ></v-text-field>
              <v-btn
                @click="joinMyData"
                class="rounded-xl mt-5"
                color="rounded-xl"
                x-large
                block
                dark
                >회원가입하기</v-btn
              >
              <v-card-actions class="text--secondary">
                <v-spacer></v-spacer>
                <!-- <router-link :to="{ name: 'SignUp' }">Sign Up</router-link> -->
                계정이 이미 있으신가요?
                <router-link :to="{ name: 'login' }">로그인</router-link>
              </v-card-actions>
            </v-form>
          </v-card-text>
          <v-card-actions class="ml-6 mr-6 text-center">
            <p style="color: #90a4ae">
              계속 진행할 경우, 당사의 개인정보 처리방침에 동의하는 것으로
              간주합니다.
              <a href="#" class="pl-2" style="color: #000000">Policy</a> and
              <a href="#" class="pl-2" style="color: #000000">Terms of Use</a>
            </p>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import http from "@/util/http-common.js";
import router from "@/router";

export default {
  name: "app-register",
  data() {
    return {
      myId: "",
      myPw: "",
      rePw: "",
      myEmail: "",
    };
  },
  methods: {
    joinMyData() {
      let user_id = this.myId;
      let user_pw = this.myPw;
      let user_email = this.myEmail;
      if (user_pw != this.rePw) {
        alert("비밀번호를 확인하시오");
      } else {
        console.log(user_id);
        http
          .post("/join", {
            user_id: user_id,
            user_pw: user_pw,
            user_email: user_email,
          })
          .then(({ data }) => {
            console.log(data);
          });

        alert("가입완료.");
        router.push({ name: "home" });
      }
    },
  },
};
</script>

<style lang="css" scoped></style>
