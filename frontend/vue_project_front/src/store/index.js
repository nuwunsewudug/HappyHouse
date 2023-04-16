import Vue from "vue";
import Vuex from "vuex";
import http from "@/util/http-common";
// import createPersistedState from "vuex-persistedstate";

Vue.use(Vuex);

import memberStore from "@/store/modules/memberStore.js";

export default new Vuex.Store({
  state: {
    sidos: [{ value: null, text: "선택하세요" }],
    guguns: [{ value: null, text: "선택하세요" }],
    houses: [],
    house: null,
    ///
    map_sidoName: "",
    map_gugunName: "",
    map_dongName: "",
    gugun_code: "",
    ///
    foodcommer: [],
    playcommer: [],
    studycommer: [],
    ///
    local: "",
    hotHouse: null,
    hotBoard: null,
  },
  getters: {},
  mutations: {
    /////////////////////////////// House start /////////////////////////////////////
    SET_SIDO_LIST(state, sidos) {
      sidos.forEach((sido) => {
        state.sidos.push({ value: sido.sidoCode, text: sido.sidoName });
      });
    },
    SET_SIDO_NAME(state, sidoName) {
      state.map_sidoName = sidoName;
    },
    SET_GUGUN_LIST(state, guguns) {
      guguns.forEach((gugun) => {
        state.guguns.push({ value: gugun.gugunCode, text: gugun.gugunName });
      });
    },
    SET_GUGUN_NAME(state, gugunName) {
      state.map_gugunName = gugunName;
    },
    SET_GUGUN_CODE(state, gugunCode) {
      state.gugun_code = gugunCode;
    },
    CLEAR_SIDO_LIST(state) {
      state.sidos = [{ value: null, text: "선택하세요" }];
    },
    CLEAR_GUGUN_LIST(state) {
      state.guguns = [{ value: null, text: "선택하세요" }];
    },
    SET_HOUSE_LIST(state, houses) {
      state.houses = houses;
    },
    SET_DETAIL_HOUSE(state, house) {
      state.house = house;
    },

    /////////////////// 상권
    SET_FOOD_LIST(state, comm) {
      state.foodcommer = comm;
    },
    SET_PLAY_LIST(state, comm) {
      state.playcommer = comm;
    },
    SET_STUDY_LIST(state, comm) {
      state.studycommer = comm;
    },

    /////////////////////////////// House end /////////////////////////////////////

    /////////////////////////////// boota ////////////////////
    SET_LOCAL(state, loc) {
      state.local = loc;
    },
    SET_HOT_HOUSE(state, house) {
      console.log(house.reivew);
      state.hotHouse = house.reivew;
    },
    SET_HOT_BOARD(state, like) {
      console.log(like.board);
      state.hotBoard = like.board;
    },
  },
  actions: {
    /////////////////////////////// House start /////////////////////////////////////
    getSido({ commit }) {
      http
        .get(`/map/sido`)
        .then(({ data }) => {
          // console.log(data);
          commit("SET_SIDO_LIST", data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getSidoName({ commit }, sidoCode) {
      const params = { sido: sidoCode };
      http
        .get(`/map/sname`, { params })
        .then(({ data }) => {
          commit("SET_SIDO_NAME", data[0].sidoName);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getGugun({ commit }, sidoCode) {
      const params = { sido: sidoCode };
      http
        .get(`/map/gugun`, { params })
        .then(({ data }) => {
          // console.log(commit, response);
          commit("SET_GUGUN_LIST", data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getGugunName({ commit }, gugunCode) {
      const params = { gugun: gugunCode };
      http
        .get(`/map/guname`, { params })
        .then(({ data }) => {
          commit("SET_GUGUN_NAME", data[0].gugunName);
        })
        .catch((error) => {
          console.log(error);
        });
    },

    getHouseList({ commit }, gugunCode) {
      // vue cli enviroment variables 검색
      //.env.local file 생성.
      // 반드시 VUE_APP으로 시작해야 한다.
      const SERVICE_KEY = process.env.VUE_APP_APT_DEAL_API_KEY;
      // const SERVICE_KEY =
      //   "9Xo0vlglWcOBGUDxH8PPbuKnlBwbWU6aO7%2Bk3FV4baF9GXok1yxIEF%2BIwr2%2B%2F%2F4oVLT8bekKU%2Bk9ztkJO0wsBw%3D%3D";
      const SERVICE_URL =
        "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev";
      const params = {
        LAWD_CD: gugunCode,
        DEAL_YMD: "202203",
        serviceKey: decodeURIComponent(SERVICE_KEY),
      };
      http
        .get(SERVICE_URL, { params })
        .then(({ data }) => {
          // console.log(commit, data);
          commit("SET_GUGUN_CODE", gugunCode);
          commit("SET_HOUSE_LIST", data.response.body.items.item);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    detailHouse({ commit }, house) {
      // 나중에 house.일련번호를 이용하여 API 호출
      // console.log(commit, house);
      commit("SET_DETAIL_HOUSE", house);
    },
    /////////////////////////////// House end /////////////////////////////////////

    /////////////////////////////// 상권 ////////////////////
    getFoodList({ commit }, payload) {
      console.log(payload);
      const SERVICE_KEY = process.env.VUE_APP_STORE_GUGUN_API_KEY;
      const SERVICE_URL =
        "http://apis.data.go.kr/B553077/api/open/sdsc2/storeListInDong";
      const params = {
        servicekey: decodeURIComponent(SERVICE_KEY),
        divId: "signguCd",
        key: payload.gugunCode,
        type: "json",
        indsLclsCd: payload.LCD,
        numOfRows: 1000,
        // indsMclsCd: MCD,
        // indsSclsCd: "Q12A01",
      };
      http
        .get(SERVICE_URL, { params })
        .then(({ data }) => {
          console.log(commit, data.body);
          commit("SET_FOOD_LIST", data.body.items);
        })
        .catch((error) => {
          console.log(error);
        });
    },

    getPlayList({ commit }, payload) {
      console.log(payload);
      const SERVICE_KEY = process.env.VUE_APP_STORE_GUGUN_API_KEY;
      const SERVICE_URL =
        "http://apis.data.go.kr/B553077/api/open/sdsc2/storeListInDong";
      const params = {
        servicekey: decodeURIComponent(SERVICE_KEY),
        divId: "signguCd",
        key: payload.gugunCode,
        type: "json",
        indsLclsCd: payload.LCD,
        numOfRows: 1000,
        // indsMclsCd: MCD,
        // indsSclsCd: "Q12A01",
      };
      http
        .get(SERVICE_URL, { params })
        .then(({ data }) => {
          console.log(commit, data.body);
          commit("SET_PLAY_LIST", data.body.items);
        })
        .catch((error) => {
          console.log(error);
        });
    },

    getStudyList({ commit }, payload) {
      console.log(payload);
      const SERVICE_KEY = process.env.VUE_APP_STORE_GUGUN_API_KEY;
      const SERVICE_URL =
        "http://apis.data.go.kr/B553077/api/open/sdsc2/storeListInDong";
      const params = {
        servicekey: decodeURIComponent(SERVICE_KEY),
        divId: "signguCd",
        key: payload.gugunCode,
        type: "json",
        indsLclsCd: payload.LCD,
        numOfRows: 1000,
        // indsMclsCd: MCD,
        // indsSclsCd: "Q12A01",
      };
      http
        .get(SERVICE_URL, { params })
        .then(({ data }) => {
          console.log(commit, data.body);
          commit("SET_STUDY_LIST", data.body.items);
        })
        .catch((error) => {
          console.log(error);
        });
    },

    /////////////////// boota /////////////
    getLocal({ commit }, local) {
      commit("SET_LOCAL", local);
    },

    getHotHouse({ commit }) {
      http
        .get(`/reivew/hot`)
        .then(({ data }) => {
          commit("SET_HOT_HOUSE", data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getHotBoard({ commit }) {
      http
        .get(`/boota/hot`)
        .then(({ data }) => {
          console.log(data);
          commit("SET_HOT_BOARD", data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
  modules: { memberStore },
  plugins: [
    // createPersistedState({
    //   // 브라우저 종료시 제거하기 위해 localStorage가 아닌 sessionStorage로 변경. (default: localStorage)
    //   // storage: sessionStorage,
    //   // paths: ["memberStore"],
    // }),
  ],
});
