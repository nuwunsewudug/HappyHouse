<template>
  <div class="regist">
    <div style="text-align: right">
      <v-btn
        color="indigo"
        @click="writePage"
        class="white--text writeBtn"
        rounded
      >
        질문하러 가기</v-btn
      >
    </div>
    <div v-if="boards.length">
      <v-simple-table>
        <template v-slot:default>
          <thead>
            <tr>
              <th class="text-left" width="7%">글번호</th>
              <th class="text-left" width="50%">제목</th>
              <th class="text-left" width="15%">작성자</th>
              <th class="text-left" width="15%">작성일시</th>
              <th class="text-left" width="7%">조회수</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(board, index) in boards" :key="index">
              <td>{{ board.bno }}</td>
              <td class="alink">
                <a href="#" @click="movePage(board.bno)">{{ board.btitle }}</a>
              </td>
              <td>{{ board.bwriter }}</td>
              <td>{{ board.bwrite_date }}</td>
              <td>{{ board.bread_count }}</td>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
    </div>

    <div v-else class="text-center"><img src="@/assets/noboard.png" /></div>

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
    <v-container class="d-flex justify-center align-center">
      <v-form ref="form">
        <v-text-field
          v-model="keyword"
          placeholder="검색어를 입력하세요"
        ></v-text-field>
      </v-form>
      <v-btn
        color="indigo"
        @click="searchPage()"
        class="white--text searchBtn mb-12"
        rounded
      >
        <v-icon>mdi-magnify</v-icon></v-btn
      >
    </v-container>
  </div>
</template>

<script>
import http from "@/util/http-common.js";

export default {
  components: {},
  data() {
    return {
      page: 0,
      boards: [],
      startPage: 0,
      totalPage: 0,
      endPage: 0,
      keyword: "",
    };
  },
  created() {
    http.get("/board").then(({ data }) => {
      console.log(data);
      this.boards = data.boardList;
      this.startPage = data.startPage;
      this.totalPage = data.totalPage;
      this.endPage = data.endPage;
    });
  },
  methods: {
    movePage(bno) {
      this.$router.push({ path: "/qna/detail/" + bno });
    },
    writePage() {
      this.$router.push("/qna/write");
    },
    searchPage() {
      http.get("/board/search?key=" + this.keyword).then(({ data }) => {
        console.log(data);
        this.boards = data.boardList;
        this.startPage = data.startPage;
        this.totalPage = data.totalPage;
        this.endPage = data.endPage;
        console.log(this.startPage);
      });
    },
    movePageLink(p) {
      http.get("/board?p=" + p).then(({ data }) => {
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
  color: #4e5fbb;
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
</style>
