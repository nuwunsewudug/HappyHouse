<template>
  <v-container class="d-flex justify-center">
    <v-card class="mb-16" max-width="800px">
      <v-card-title>
        <v-img height="80" src="@/assets/bootawrite.png"></v-img>
        <span class="text-h5 font-weight-bold mb-10">글 삭제</span>
      </v-card-title>
      <v-card-text>
        <v-row>
          <v-col rows="3" cols="12" md="6">
            <v-text-field
              label="글을 작성할때 설정한 비밀번호를 입력하세요*"
              type="password"
              name="btb_pw"
              id="btb_pw"
              v-model="btb_pw"
              required
            ></v-text-field>
          </v-col>
        </v-row>

        <small>*삭제하면 되돌릴 수 없습니다.</small>
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="blue darken-1" text @click="deleteBoota()">
          삭제하기
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-container>
</template>

<script>
import http from "@/util/http-common.js";

export default {
  data() {
    return {
      btb_pw: "",
      board: [],
    };
  },

  created() {
    let btbno = this.$route.params.btbno;

    http.get("/boota/" + btbno).then(({ data }) => {
      console.log(data);
      this.board = data.board;
    });
  },
  methods: {
    deleteBoota() {
      if (this.btb_pw == this.board.btb_pw) {
        http.delete("/boota/" + this.board.btbno).then((resp) => {
          console.log(resp);
          alert("삭제가 완료되었습니다.");
          this.moveList();
        });
      } else {
        alert("비밀번호를 확인하세요");
      }
    },
    moveList() {
      this.$router.push({ path: "/boota/" });
    },
  },
};
</script>

<style></style>
