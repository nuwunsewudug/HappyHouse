<template>
  <v-card class="mx-auto my-12" max-width="700" max-height="10000">
    <v-img height="100" src="@/assets/bootawrite.png"></v-img>

    <v-card-title class="mb-5">
      <!-- <p class="qtext"></p> -->
      <h2>{{ board.btb_title }}</h2></v-card-title
    >

    <v-card-text>
      <v-row align="center" class="mx-0 mb-2">
        <div class="my-1 grey--text">작성일 : {{ board.btb_write_date }}</div>
      </v-row>

      <div class="my-1 mb-10 grey--text">익명</div>

      <div class="black--text body-1">
        {{ board.btb_content }}
      </div>
    </v-card-text>

    <v-divider class="mx-4"></v-divider>

    <!-- <v-card-title><p class="atext"></p></v-card-title> -->

    <v-card-text class="d-flex justify-center mb-14" style="height: 130px">
      <v-btn
        style="width: 15%; height: 95%"
        class="rounded-circle mt-10"
        color="#ECEFF1"
        ><v-container>
          <v-row class="d-flex justify-center"
            ><v-col class="mt-6 pa-0 mb-0 text-h5 d-flex justify-center">{{
              board.like_count
            }}</v-col></v-row
          >
          <v-row class="d-flex justify-center">
            <v-col>
              <v-icon class="pa-0 mt-0 mb-4" @click="updateLike">
                mdi-thumb-up</v-icon
              >
            </v-col>
          </v-row>
        </v-container>
      </v-btn>
    </v-card-text>
    <v-card-text class="d-flex justify-space-around mt-5 mb-6">
      <v-btn class="rounded-xl" color="#eceff1"
        ><router-link :to="'/boota/modify/' + board.btbno" class="btn corbtn"
          >수정</router-link
        >
      </v-btn>
      <v-btn class="rounded-xl" color="#455A64">
        <router-link :to="'/boota/delete/' + board.btbno" class="btn delbtn"
          >삭제</router-link
        ></v-btn
      >
      <v-btn class="rounded-xl" color="#eceff1">
        <router-link to="/boota" class="btn listbtn">목록</router-link>
      </v-btn>
      <v-btn class="rounded-xl">
        <router-link :to="'/boota/commentWrite/' + board.btbno" class="btn"
          >댓글달기</router-link
        >
      </v-btn>
    </v-card-text>
    <v-divider class="mx-4"></v-divider>
    <v-card-text v-if="comments.length">
      <v-simple-table>
        <template>
          <thead>
            <tr>
              <th class="text-center" width="10%">작성자</th>
              <th class="text-center" width="50%">답변</th>
              <th class="text-center" width="20%">좋아요</th>
              <th class="text-center" width="10%"></th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(comment, index) in comments" :key="index">
              <td class="text-center">익명{{ index }}</td>
              <td class="text-center">{{ comment.ccontent }}</td>
              <td class="text-center">{{ comment.like_count }}</td>
              <td class="text-center">
                <v-icon
                  class="thumb"
                  @click="updateCommentLike(comment.comment_no)"
                >
                  mdi-thumb-up</v-icon
                >
              </td>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
    </v-card-text>
    <v-card-text v-else>댓글이 한 개도 없네요</v-card-text>
  </v-card>
</template>

<script>
import http from "@/util/http-common.js";

export default {
  data: function () {
    return {
      board: {},
      comments: {},
      btbnoTemp: 0,
    };
  },
  created() {
    let btbno = this.$route.params.btbno;
    this.btbnoTemp = btbno;
    console.log(btbno);

    http
      .get("/boota/" + btbno)
      .then(({ data }) => {
        console.log(data.board);
        this.board = data.board;
      })
      .catch((error) => {
        console.log(error);
      });

    http
      .get("boota/comment/" + btbno)
      .then(({ data }) => {
        console.log(data);
        this.comments = data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {
    updateLike() {
      let btbno = this.btbnoTemp;

      http
        .put("/boota/like/" + btbno)
        .then(({ data }) => {
          console.log(data);
        })
        .catch((error) => {
          console.log(error);
        });
      this.setBoard();
    },
    setBoard() {
      let btbno = this.btbnoTemp;

      http
        .get("/boota/" + btbno)
        .then(({ data }) => {
          this.board = data.board;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    updateCommentLike(val) {
      let comment_no = val;
      console.log(comment_no);

      http
        .put("/boota/comment/like/" + comment_no)
        .then(({ data }) => {
          console.log(data);
        })
        .catch((error) => {
          console.log(error);
        });
      this.setComment();
    },
    setComment() {
      let btbno = this.btbnoTemp;

      http
        .get("boota/comment/" + btbno)
        .then(({ data }) => {
          this.comments = data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>

<style scoped>
.btn {
  text-decoration: none;
}
.delbtn {
  color: #eceff1;
}
.corbtn {
  color: #37473f;
}
/* .listbtn {
  color: #eceff1;
} */
.qtext {
  font-size: 30px;
  font-weight: bold;
  color: #6c63ff;
  margin-right: 10px;
}
.atext {
  font-size: 30px;
  font-weight: bold;
  color: #eb5b3a;
}

.thumb {
  background-color: #6c63ff;
  padding: 5px;
  border-radius: 100%;
  font-size: 20px;
  color: white;
}
</style>
