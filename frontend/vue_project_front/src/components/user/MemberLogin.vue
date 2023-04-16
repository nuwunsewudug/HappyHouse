<template>
  <v-container class="fill-height" fluid>
    <v-row align="center" justify="center" dense>
      <v-col cols="12" sm="6" md="3" lg="3">
        <v-card elevation="0">
          <!-- <div class="text-center">
            <h1 class="mb-2">Login</h1>
          </div> -->

          <v-img src="@/assets/login.png" contain height="200"></v-img>

          <v-card-text v-if="kakaoCheck">
            <h2>{{ kakao_account }}</h2>
            <h2>{{ nickname }}</h2>
            <h2>{{ email }}</h2>
          </v-card-text>

          <v-card-text v-if="naverCheck">
            <v-card-text>
              <div class="titletext">
                {{ naverLogin.user.name }} 님 반갑습니다
              </div>
              <div class="subtitletext">
                네이버 이메일 : {{ naverLogin.user.email }}
              </div>
            </v-card-text>

            <v-btn type="button" @click="logout">로그아웃</v-btn>
          </v-card-text>

          <v-card-text v-if="check">
            <v-form>
              <v-text-field
                label="아이디를 입력하세요"
                name="email"
                prepend-inner-icon="mdi-account"
                type="email"
                class="rounded-xl"
                outlined
                v-model="user.user_id"
                @keyup.enter="confirm"
              ></v-text-field>
              <v-text-field
                label="비밀번호를 입력하세요"
                name="password"
                prepend-inner-icon="mdi-lock"
                type="password"
                suffix="| 잊으셨나요?"
                class="rounded-xl"
                outlined
                v-model="user.user_pw"
                @keyup.enter="confirm"
              ></v-text-field>
              <v-btn
                class="rounded-xl mt-16 mb-16"
                color="rounded-xl"
                x-large
                block
                dark
                @click="confirm"
                >Login</v-btn
              >

              <v-row>
                <v-col cols="6" class="d-flex justify-center mt-1">
                  <div id="naverIdLogin"></div>
                </v-col>

                <v-col cols="6" class="d-flex justify-center mb-7">
                  <a id="custom-login-btn" @click="kakaoLogin()">
                    <img
                      class="kakaoLogin"
                      src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_narrow.png"
                    />
                  </a>
                </v-col>
              </v-row>

              <v-card-actions class="text--secondary">
                <v-checkbox color="#000000" label="Remember me"></v-checkbox>
                <v-spacer></v-spacer>
                <!-- <router-link :to="{ name: 'SignUp' }">Sign Up</router-link> -->
                계정이 없으신가요?
                <router-link :to="{ name: 'join' }">회원가입</router-link>
              </v-card-actions>
            </v-form>
          </v-card-text>
          <v-card-actions class="ml-6 mr-6 text-center">
            <p style="color: #90a4ae">
              계속 진행할 경우, 당사의 개인정보 처리방침에 동의하는 것으로
              간주합니다.
              <a href="#" class="pl-2" style="color: #000000">Policy </a> and
              <a href="#" class="pl-2" style="color: #000000">Terms of Use</a>
            </p>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { mapState, mapActions } from "vuex";
import axios from "axios";
const memberStore = "memberStore";
export default {
  name: "MemberLogin",
  data() {
    return {
      user: {
        user_id: null,
        user_pw: null,
      },
      naverLogin: null,
      sampleData: "",
      check: true,
      naverCheck: false,
      kakaoCheck: false,
    };
  },
  mounted() {
    this.naverLogin = new window.naver.LoginWithNaverId({
      clientId: "ETE3cgrx1amxAEe0KUxg",
      callbackUrl: "http://localhost:8080/login",
      isPopup: false,
      loginButton: {
        color: "green",
        type: 3,
        height: 50,
      },
    });

    this.naverLogin.init();

    this.naverLogin.getLoginStatus((status) => {
      if (status) {
        console.log(status);
        console.log(this.naverLogin.user);
        //필수적으로 받아야 하는 프로필 정보가 있다면 callback 처리 시점에 체크
        var email = this.naverLogin.user.getEmail();
        if (email == undefined || email == null) {
          alert("이메일은 필수 정보입니다. 정보 제공을 동의해주세요.");
          //사용자 정보 재동의를 위하여 다시 네아로 동의 페이지로 이동함
          this.naverLogin.reprompt();
          return;
        }
        this.check = false;
        this.naverCheck = true;
      } else {
        console.log("callback 처리에 실패하였습니다.");
      }
    });
  },
  computed: {
    ...mapState(memberStore, ["isLogin", "isLoginError"]),
  },
  methods: {
    ...mapActions(memberStore, ["userConfirm", "getUserInfo"]),
    async confirm() {
      await this.userConfirm(this.user);
      let token = sessionStorage.getItem("access-token");
      console.log(token);
      if (this.isLogin) {
        console.log("hey");
        await this.getUserInfo(token);
        console.log(token);
        this.$router.push({ name: "home" });
      }
    },

    movePage() {
      this.$router.push({ name: "signup" });
    },

    logout() {
      this.naverLogin.logout();
      alert("네이버 로그아웃");
      this.$router.push({ name: "home" });
      const accessToken = this.naverLogin.accessToken.accessToken;
      const url = `/oauth2.0/token?grant_type=delete&client_id=ETE3cgrx1amxAEe0KUxg&client_secret=MmUXW1tKC5&access_token=${accessToken}&service_provider=NAVER`;
      axios.get(url).then((res) => {
        console.log(res.data);
      });
    },

    kakaoLogin() {
      window.Kakao.Auth.login({
        scope: "",
        success: this.getKakaoAccount,
      });
    },
    getKakaoAccount() {
      window.Kakao.API.request({
        url: "/v2/user/me",
        success: (res) => {
          const kakao_account = res.kakao_account;
          const nickname = kakao_account.profile.nickname;
          const email = kakao_account.email;
          console.log(res);
          console.log("nickname : ", nickname);
          console.log("email : ", email);
          //로그인 처리 구현
          alert("로그인성공!");
          this.kakaoCheck = true;
          this.check = false;
        },
        fail: (error) => {
          console.log(error);
        },
      });
    },
    kakaoLogout() {
      window.Kakao.Auth.logout((response) => {
        //로그아웃
        console.log(response);
      });
    },
  },
};
</script>

<style lang="css" scoped>
.kakaoLogin {
  width: 217px;
}
</style>
