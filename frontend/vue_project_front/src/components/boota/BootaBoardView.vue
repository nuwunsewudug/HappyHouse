<template v-slot:default>
  <div>
    <v-container class="ma-0 pa-0 d-flex align-center">
      <v-form ref="form">
        <v-text-field
          class="tinput"
          v-model="keyword"
          placeholder="검색하기"
        ></v-text-field>
      </v-form>
      <v-btn
        color="indigo"
        @click="searchPage()"
        class="white--text searchBtn ml-4 mb-13"
        rounded
      >
        <v-icon>mdi-magnify</v-icon></v-btn
      >
    </v-container>
    <v-card class="mx-auto" max-width="90%">
      <div>
        <v-simple-table>
          <template v-slot:default>
            <thead>
              <tr>
                <th class="text-left" width="7%">글번호</th>
                <th class="text-left" width="35%">제목</th>
                <th class="text-left" width="15%">작성일시</th>
                <th class="text-left" width="15%">좋아요</th>
                <th class="text-left" width="7%">조회수</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(board, index) in boards" :key="index">
                <td>{{ board.btbno }}</td>
                <td class="alink">
                  <a href="#" @click="movePage(board.btbno)">{{
                    board.btb_title
                  }}</a>
                </td>
                <td>{{ board.btb_write_date }}</td>
                <td>{{ board.like_count }}</td>
                <td>{{ board.btb_read_count }}</td>
              </tr>
            </tbody>
          </template>
        </v-simple-table>
      </div>
      <div class="pagination">
        <template>
          <div class="text-center">
            <v-pagination
              v-model="page"
              :length="totalPage"
              :total-visible="7"
              circle
              @input="movePageLink(page)"
            ></v-pagination>
          </div>
        </template>
      </div>
    </v-card>
  </div>
</template>

<script>
import http from "@/util/http-common.js";
import { mapState } from "vuex";

export default {
  name: "BootaBoardView",
  components: {},
  props: ["nowloc"],
  data() {
    return {
      boards: [],
      page: 0,
      startPage: 0,
      totalPage: 0,
      endPage: 0,
      keyword: "",
    };
  },
  created() {
    if (this.local) {
      http.get("/boota?key=" + this.local).then(({ data }) => {
        console.log(data);
        this.boards = data.boardList;
        this.startPage = data.startPage;
        this.totalPage = data.totalPage;
        this.endPage = data.endPage;
      });
    }
  },
  computed: {
    ...mapState(["local"]),
    checkLoc() {
      console.log(this.local);
      return this.local;
    },
  },
  watch: {
    checkLoc(val) {
      console.log(val);
      this.loc = val;
      this.makeLocalBoard(val);
    },
  },
  methods: {
    movePage(btbno) {
      this.$router.push({ path: "/boota/detail/" + btbno });
    },
    // writePage() {
    //   this.$router.push("/boota/write");
    // },
    searchPage() {
      http.get("/boota/search?key=" + this.keyword).then(({ data }) => {
        console.log(data);
        this.boards = data.boardList;
        this.startPage = data.startPage;
        this.totalPage = data.totalPage;
        this.endPage = data.endPage;
        console.log(this.startPage);
      });
    },
    movePageLink(p) {
      console.log(p);
      http.get("/boota?p=" + p + "&key=" + this.local).then(({ data }) => {
        console.log(data);
        this.boards = data.boardList;
        this.startPage = data.startPage;
        this.totalPage = data.totalPage;
        this.endPage = data.endPage;
      });
    },
    makeLocalBoard(key) {
      http.get("/boota?key=" + key).then(({ data }) => {
        console.log(data);
        this.boards = data.boardList;
        this.startPage = data.startPage;
        this.totalPage = data.totalPage;
        this.endPage = data.endPage;
      });
    },
  },
};
</script>

<style scoped>
a {
  text-decoration: none;
  font-weight: bold;
  color: none;
}
.alink > a {
  color: #4caf50;
}
.writeBtn {
  margin: 15px;
}
.v-text-field {
  width: 400px;
}

.searchBtn {
  margin-top: 45px;
  margin-left: 50px;
}

.container {
  position: relative;

  left: 83%;
}
.tinput {
  width: 120px;
}
</style>
