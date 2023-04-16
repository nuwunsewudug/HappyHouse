import jwt_decode from "jwt-decode";
import { login } from "@/api/member.js";

const memberStore = {
  namespaced: true,
  state: {
    isLogin: false,
    isLoginError: false,
    userInfo: null,
  },
  getters: {
    checkUserInfo: function (state) {
      return state.userInfo;
    },
  },
  mutations: {
    SET_IS_LOGIN: (state, isLogin) => {
      state.isLogin = isLogin;
    },
    SET_IS_LOGIN_ERROR: (state, isLoginError) => {
      state.isLoginError = isLoginError;
    },
    SET_LOGOUT: (state, isNull) => {
      state.isLogin = false;
      state.userInfo = isNull;
    },
    SET_USER_INFO: (state, userInfo) => {
      state.isLogin = true;
      state.userInfo = userInfo;
    },
  },
  actions: {
    async userConfirm({ commit }, user) {
      console.log(user);
      let user_id = user.user_id;
      let user_pw = user.user_pw;
      await login(
        { user_id, user_pw },
        (response) => {
          console.log(response);
          if (response) {
            console.log("success!!");
            let token = response.data["access_TOKEN"];
            commit("SET_IS_LOGIN", true);
            commit("SET_IS_LOGIN_ERROR", false);
            sessionStorage.setItem("access-token", token);
          } else {
            commit("SET_IS_LOGIN", false);
            commit("SET_IS_LOGIN_ERROR", true);
          }
        },
        () => {},
      );
    },
    getUserInfo({ commit }, token) {
      let decode_token = jwt_decode(token);
      console.log(decode_token);
      commit("SET_USER_INFO", decode_token.userId);
    },
    getLogout({ commit }) {
      sessionStorage.clear;
      let isNull = null;
      commit("SET_LOGOUT", isNull);
    },
  },
};

export default memberStore;
