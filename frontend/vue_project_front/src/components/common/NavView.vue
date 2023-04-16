<template>
  <v-toolbar flat height="100px">
    <v-toolbar-title
      ><router-link to="/">
        <img
          src="@/assets/happy3.png"
          class="align-middle"
          width="130px"
          alt="Kitten"
        /> </router-link
    ></v-toolbar-title>

    <v-spacer></v-spacer>

    <v-btn text><router-link to="/qna" class="link">Q&A</router-link> </v-btn>

    <v-btn text><router-link to="/house" class="link">MAP</router-link></v-btn>

    <v-btn text
      ><router-link to="/boota" class="link">부동산 타임</router-link>
    </v-btn>
    <v-menu bottom>
      <template v-slot:activator="{ on, attrs }">
        <v-btn icon v-bind="attrs" v-on="on">
          <v-icon>mdi-account</v-icon>
        </v-btn>
      </template>

      <v-list>
        <v-list-item v-if="loginCheck">
          <v-list-item-title
            ><router-link to="/login" class="link"
              >로그인</router-link
            ></v-list-item-title
          >
        </v-list-item>
        <v-list-item @click="logout" v-if="logoutCheck">
          <v-list-item-title
            ><router-link to="/join" class="link"
              >로그아웃</router-link
            ></v-list-item-title
          >
        </v-list-item>
        <v-list-item>
          <v-list-item-title
            ><router-link to="/mypage" class="link"
              >회원정보</router-link
            ></v-list-item-title
          >
        </v-list-item>
        <v-list-item>
          <v-list-item-title
            ><router-link to="/join" class="link"
              >회원가입</router-link
            ></v-list-item-title
          >
        </v-list-item>
      </v-list>
    </v-menu>
  </v-toolbar>
</template>

<script>
import { mapState, mapActions } from "vuex";
const memberStore = "memberStore";

export default {
  data() {
    return {
      loginCheck: true,
      logoutCheck: false,
      drawer: null,
    };
  },
  computed: {
    ...mapState(memberStore, ["isLogin"]),
    checkLogin() {
      return this.isLogin;
    },
  },
  watch: {
    checkLogin(val) {
      if (val == true) {
        this.loginCheck = false;
        this.logoutCheck = true;
      } else {
        this.loginCheck = true;
        this.logoutCheck = false;
      }
    },
  },
  methods: {
    ...mapActions(memberStore, ["getLogout"]),
    logout() {
      this.getLogout();
      this.$router.push({ name: "home" });
    },
    checkNav() {},
  },
};
</script>

<style scoped>
.link {
  text-decoration: none;
  color: #707070;
}
</style>
